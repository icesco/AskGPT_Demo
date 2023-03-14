//
//  ChatViewModel.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import Foundation
import OpenAISwift

extension Message {
    
    var toChatMessage: ChatMessage {
        return ChatMessage(role: isSender ? .user : .assistant, content: self.text)
    }
    
}

final class ChatViewModel: ObservableObject {
    
    @Published var messages: [Message] = []
    
    @Published var isResponding: Bool = false
    
    @Published var lastMessage: Message?
    
    private var chatTask: Task<Void, Never>?
    private var openAI: OpenAISwift
    private let store = TokenStore()
    
    @Published var isNotReadyToChat: Bool = true
    
    init() {
        if let token = store.token() {
            self.openAI = OpenAISwift(authToken: token)
            self.isNotReadyToChat = false
        } else {
            self.openAI = OpenAISwift(authToken: "")
            self.isNotReadyToChat = true
        }
    }
    
    func login(_ token: String) {
        guard store.setToken(token) else {
            return
        }
        
        self.openAI = OpenAISwift(authToken: token)
        self.isNotReadyToChat = false
    }
    
    func clearChat() {
        self.messages = []
        self.lastMessage = nil
    }
    
    @MainActor
    func sendNewMessage(_ text: String) {
        let message = Message(text: text, isSender: true)
        messages.append(message)
        lastMessage = message
        queryAI(text)
    }
    
    @MainActor
    func queryAI(_ prompt: String) {
        isResponding = true
        chatTask = Task { [weak self] in
            
            defer { self?.chatTask = nil }
            
            guard let self else {
                return
            }
            
            do {
                
                let result = try await openAI.sendChat(with: messages.compactMap { $0.toChatMessage })
                print(result.choices.compactMap { $0.message.content }.joined(separator: "!!!"))
                let newMessages: [Message] = result.choices.compactMap { result in
                    return Message(text: result.message.content, isSender: false)
                }
                
                self.messages.append(contentsOf: newMessages)
                self.isResponding = false
                self.lastMessage = newMessages.last
            } catch {
                print("Something went wrong")
                self.isResponding = false
                self.messages.append(Message(text: "Error: \(error)", isSender: false, isError: true))
            }
        }
    }
    
    func addRandomMessage() {
        let newMessage = Message(text: "Hello hello", isSender: .random())
        messages.append(newMessage)
        lastMessage = newMessage
    }
    
}

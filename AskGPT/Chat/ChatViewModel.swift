//
//  ChatViewModell.swift
//  AskGPT
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import ChatKit
import OpenAISwift

final class OpenAIChatViewModel: AnyChatViewModel<Message> {
    
    private var chatTask: Task<Void, Never>?
    private(set) var openAI: OpenAISwift
    
    init(openAI: OpenAISwift) {
        self.openAI = openAI
        super.init(messages: [])
        self.openAI = openAI
    }
             
    func setOpenAI(_ opeAI: OpenAISwift) {
        self.openAI = opeAI
    }
    
    func sendMessageSync(with text: String) {
        chatTask = Task { [weak self] in
            
            defer { self?.chatTask = nil }
            
            await sendMessage(with: text)
        }
    }
    
    override func sendMessage(with text: String) async {
        let message = Message(text: text, isSender: true)
        await self.appendMessage(message)
        await self.updateLastMessage(message)
        await queryAI(text)
    }
    
    @MainActor
    func queryAI(_ prompt: String) async {
        self.toggleReplying(true)
        do {
            
            let result = try await openAI.sendChat(with: self.getMessages().compactMap { $0.toChatMessage })
            print(result.choices.compactMap { $0.message.content }.joined(separator: "!!!"))
            let newMessages: [Message] = result.choices.compactMap { result in
                return Message(text: result.message.content, isSender: false)
            }
            
            self.appendMessages(newMessages)
            self.toggleReplying(false)
            self.updateLastMessage(newMessages.last)
        } catch {
            print("Something went wrong")
            self.toggleReplying(false)
            self.appendMessage(Message(text: "Error: \(error)", isSender: false, isError: true))
        }
    }
}

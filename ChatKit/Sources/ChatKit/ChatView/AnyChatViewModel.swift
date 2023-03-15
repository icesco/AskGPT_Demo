//
//  File.swift
//  
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation

open class AnyChatViewModel<MessageItem: Identifiable & Equatable>: ChatViewModel {
    
    public typealias Message = MessageItem
    
    @Published private(set) var lastMessage: Message?
    @Published private(set) var messages: [Message]
    @Published public var isReplying: Bool
    
    public init(messages: [Message]) {
        self.messages = messages
        if !messages.isEmpty {
            lastMessage = messages.last
        } else {
            lastMessage = nil
        }
        isReplying = false
    }
    
    @MainActor
    public func appendMessage(_ message: Message) {
        self.messages.append(message)
    }
    
    @MainActor
    public func appendMessages(_ messages: [Message]) {
        self.messages.append(contentsOf: messages)
    }
    
    @MainActor
    public func updateLastMessage(_ message: Message?) {
        self.lastMessage = message
    }
    
    @MainActor
    public func toggleReplying(_ state: Bool) {
        self.isReplying = state
    }
    
    public func getMessages() -> [Message] {
        return messages
    }
    
    open func sendMessage(with text: String) async {
        // Does nothing
    }
    
}

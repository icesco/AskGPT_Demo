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

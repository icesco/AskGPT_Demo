//
//  ChatBubble.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import SwiftUI

struct ChatBubble: View {
    
    let isSender: Bool
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(isSender ? .white : .primary)
            .padding()
            .background(RoundedRectangle(cornerRadius: 12.5, style: .continuous).fill(isSender ? Color.accentColor : Color.gray))
            .frame(maxWidth: .infinity, alignment: isSender ? .trailing : .leading)
            .padding()
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatBubble(isSender: true, text: "Hello world!")
            
            ScrollView {
                LazyVStack {
                    ChatBubble(isSender: true, text: "Hello world!")
                    ChatBubble(isSender: false, text: "Hello world!")
                    ChatBubble(isSender: true, text: "Hello world!")
                }
            }
        }
    }
}

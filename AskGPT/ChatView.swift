//
//  ContentView.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import SwiftUI
import ChatKit

struct ConversationView: View {
    
    @EnvironmentObject private var viewModel: OpenAIChatViewModel
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        ChatView(viewModel: viewModel) { message in
            if message.isError {
                Text("Error.. Try another query.")
                    .id(message.id)
                    .foregroundColor(.secondary)
                    .font(.caption)
            } else {
                ChatMessageContent(isSender: message.isSender,
                                   date: message.date,
                                   text: message.text)
                .inChatBubble(isSender: message.isSender)
                .padding(.horizontal, 6)
            }
        }
        .safeAreaInset(edge: .bottom) {
            ChatTextFieldView()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("Chat"))
//        .toolbarTitleMenu {
//
//        }
        
    }
}

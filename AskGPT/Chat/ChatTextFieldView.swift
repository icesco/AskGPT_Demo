//
//  ChatTextFieldView.swift
//  AskGPT
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import SwiftUI

struct ChatTextFieldView: View {
    
    @State private var typedText: String = ""
    @EnvironmentObject private var viewModel: OpenAIChatViewModel
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            if viewModel.isReplying {
                Text("Responding..")
                    .redacted(reason: .placeholder)
                    .inChatBubble(isSender: false)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
            
            HStack {
                TextField("Chat with me..", text: $typedText, axis: .vertical)
                    .lineLimit(5, reservesSpace: false)
                    .padding()
                    .background(Color(.systemFill), in: Capsule())
                
                Button {
                    viewModel.sendMessageSync(with: typedText)
                    typedText = ""
                } label: {
                    Image(systemName: viewModel.isReplying ? "arrow.up.circle" : "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 45, height: 45)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(.regularMaterial)
        }
        .disabled(viewModel.isReplying || appViewModel.isNotReadyToChat)
        .onSubmit {
            guard !viewModel.isReplying && !appViewModel.isNotReadyToChat else {
                return
            }
            viewModel.sendMessageSync(with: typedText)
            typedText = ""
        }
    }
    
}

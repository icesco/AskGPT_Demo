//
//  ContentView.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import SwiftUI

struct Message: Identifiable {
    
    let text: String
    let isSender: Bool
    let id: UUID = .init()
    
}

struct ContentView: View {
    
    @State private var typedText: String = ""
    @State private var messages: [Message] = []
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(messages) { message in
                    ChatBubble(isSender: message.isSender, text: message.text)
                }
            }
        }.safeAreaInset(edge: .bottom) {
            TextField("Chat with me..", text: $typedText)
                .background(.regularMaterial, in: Capsule())
                .padding(6)
        }.onSubmit {
            messages.append(Message(text: typedText, isSender: true))
            typedText = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

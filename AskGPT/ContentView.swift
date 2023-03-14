//
//  ContentView.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var typedText: String = ""
    @State private var apiKey: String = ""
    @StateObject private var viewModel: ChatViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.messages) { message in
                            if message.isError {
                                Text("Error.. Try another query.")
                                    .id(message.id)
                                    .foregroundColor(.secondary)
                                    .font(.caption)
                            } else {
                                ChatBubble(isSender: message.isSender, text: message.text).id(message.id)
                            }
                            
                        }
                    }
                }
                .onChange(of: viewModel.lastMessage) { message in
                    guard let message else {
                        return
                    }
                    
                    withAnimation {
                        proxy.scrollTo(message.id, anchor: .bottom)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                
                VStack {
                    if viewModel.isResponding {
                        ChatBubble(isSender: false, text: "Responding..").redacted(reason: .placeholder)
                            .transition(.move(edge: .bottom))
                    }
                    
                    HStack {
                        TextField("Chat with me..", text: $typedText, axis: .vertical)
                            .lineLimit(5, reservesSpace: false)
                            .padding()
                            .background(Color(.systemFill), in: Capsule())
                        
                        Button {
                            viewModel.sendNewMessage(typedText)
                            typedText = ""
                        } label: {
                            Image(systemName:  viewModel.isResponding ? "arrow.up.circle" : "arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 45, height: 45)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(.regularMaterial)
                }
                .disabled(viewModel.isResponding)
            }.onSubmit {
                viewModel.sendNewMessage(typedText)
                typedText = ""
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addRandomMessage()
                    } label: {
                        Label("New", systemImage: "plus.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(Color.accentColor)
                    }
                    
                }
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle(Text("AskGPT"))
                .animation(.easeOut, value: viewModel.isResponding)
                .toolbarTitleMenu {
                    Button {
                        viewModel.clearChat()
                    } label: {
                        Text("New Chat")
                    }
                }
                .sheet(isPresented: $viewModel.isNotReadyToChat) {
                    TextField("API Key", text: $apiKey)
                        .onSubmit {
                            guard !apiKey.isEmpty else {
                                return
                            }
                            
                            viewModel.login(apiKey)
                        }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

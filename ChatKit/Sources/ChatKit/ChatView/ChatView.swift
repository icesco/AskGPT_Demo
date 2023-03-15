//
//  File.swift
//  
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import SwiftUI

public typealias SwiftUIEquatable = Identifiable & Equatable

public struct ChatView<MessageItem: SwiftUIEquatable, Content: View>: View {
    
    @State private var typedText: String = ""
    @ObservedObject private var viewModel: AnyChatViewModel<MessageItem>
    private var content: (MessageItem) -> Content
    
    public init(viewModel: AnyChatViewModel<MessageItem>,
                @ViewBuilder content: @escaping (MessageItem) -> Content) {
        self.content = content
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        content(message)
                            .id(message.id)
                    }
                }
            }
            .scrollDismissesKeyboard(.interactively)
            .onChange(of: viewModel.lastMessage) { message in
                guard let message else {
                    return
                }
                
                withAnimation {
                    proxy.scrollTo(message.id, anchor: .bottom)
                }
            }
        }
        .animation(.easeOut, value: viewModel.isReplying)
    }
}

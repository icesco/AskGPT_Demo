//
//  File.swift
//  
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import SwiftUI

public struct ChatBubbleModifier: ViewModifier {
    
    var isSender: Bool
    @Environment(\.theme) var theme
    
    public func body(content: Content) -> some View {
        content
            .padding(12)
            .background(background)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: isSender ? .trailing : .leading)
                .padding(.horizontal)
    }
    
    @ViewBuilder
    private var background: some View {
        if isSender {
            ChatBubbleShape().fill(theme.senderBackgroundColor.gradient)
        } else {
            ChatBubbleShape().fill(theme.issuerBackgroundColor).rotation3DEffect(.radians(.pi), axis: (0.0, 1.0, 0.0))
        }
    }
}

public extension View {
    
    func inChatBubble(isSender: Bool) -> some View {
        self.modifier(ChatBubbleModifier(isSender: isSender))
    }
    
}

public struct ChatBubble<Content: View>: View {
    
    let isSender: Bool
    var content: Content
    @Environment(\.theme) var theme
    
    public init(isSender: Bool,
                @ViewBuilder content: () -> Content) {
        self.isSender = isSender
        self.content = content()
    }
  
    public var body: some View {
        content
        .padding(12)
        .background(background)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: isSender ? .trailing : .leading)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private var background: some View {
        if isSender {
            ChatBubbleShape().fill(theme.senderBackgroundColor.gradient)
        } else {
            ChatBubbleShape().fill(theme.issuerBackgroundColor).rotation3DEffect(.radians(.pi), axis: (0.0, 1.0, 0.0))
        }
    }
}

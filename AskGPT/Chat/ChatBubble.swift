//
//  ChatBubble.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import SwiftUI
import MarkdownUI
import ChatKit

struct ChatMessageContent: View {
    
    @Environment(\.theme) var theme
    let isSender: Bool
    let date: Date
    let text: String
    
    var body: some View {
        VStack(alignment: isSender ? .trailing : .leading, spacing: 6) {
            Markdown(text)
                .markdownTextStyle(textStyle: {
                    ForegroundColor(isSender ? theme.senderTextColor : theme.issuerTextColor)
                })
                .markdownCodeSyntaxHighlighter(ChatCodeHighlighter())
                
                Text(date, style: .time)
                    .font(.caption2)
                    .foregroundColor(isSender ? Color.white.opacity(0.7) : .secondary)
             
        }
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           
            ScrollView {
                LazyVStack(spacing: 20) {
                    ChatBubble(isSender: false) {
                        ChatMessageContent(isSender: false, date: .now.addingTimeInterval(-200000), text: "Rose\n\n\nrosse\n\ncadono per terra per terra per terra")
                    }
                    
                    ChatBubble(isSender: true) {
                        ChatMessageContent(isSender: true, date: .now.addingTimeInterval(-200000), text: "Rose\n\n\nrosse\n\ncadono per terra per terra per terra")
                    }
                    
                    ChatBubble(isSender: false) {
                        ChatMessageContent(isSender: false, date: .now.addingTimeInterval(-200000), text: "Rose\n\n\nrosse\n\ncadono per terra per terra per terra")
                    }
                    
                    ChatBubble(isSender: false) {
                        ChatMessageContent(isSender: false, date: .now, text: "This code does something:\n```swift\nstruct Time: Codable {\n\tvar item = \"Ciao\"\n}\n```\nThere you go, you have your first struct in Swift!!")
                    }
                }
            }
        }
    }
}

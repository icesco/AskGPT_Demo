//
//  ChatBubble.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import SwiftUI
import MarkdownUI

struct ChatBubble: View {
    
    let isSender: Bool
    let date: Date
    let text: String
  
    var body: some View {
        VStack(alignment: isSender ? .trailing : .leading, spacing: 6) {
            Markdown(text)
                .markdownTextStyle(textStyle: {
                    ForegroundColor(isSender ? .white : .primary)
                })
                .markdownCodeSyntaxHighlighter(ChatCodeHighlighter())
                
   
                Text(date, style: .time)
                    .font(.caption2)
                    .foregroundColor(isSender ? Color.white.opacity(0.7) : .secondary)
             
        }
        .padding(12)
        .background(ChatBubbleShape().fill(isSender ? Color.accentColor.gradient : Color(.secondarySystemFill).gradient).rotation3DEffect(.radians( isSender ? 0 : .pi), axis: (0.0, 1.0, 0.0)))
            .frame(minWidth: 0, maxWidth: 500, alignment: isSender ? .trailing : .leading)
            .padding(.horizontal)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           
            ScrollView {
                LazyVStack(spacing: 20) {
                    ChatBubble(isSender: false, date: .now.addingTimeInterval(-200000), text: "Rose\n\n\nrosse\n\ncadono per terra per terra per terra")
                    ChatBubble(isSender: true, date: .now.addingTimeInterval(-20000), text: "Hello world\n\nI'm going a capo!")
                    ChatBubble(isSender: false, date: .now.addingTimeInterval(-7600), text: "\n\nHello world!\n\nCiao ciao **bold text**")
                    ChatBubble(isSender: true, date: .now.addingTimeInterval(-3600), text: "Hello world! *This is italics*")
                    ChatBubble(isSender: false, date: .now, text: "This code does something:\n```swift\nstruct Time: Codable {\n\tvar item = \"Ciao\"\n}\n```\nThere you go, you have your first struct in Swift!!")
                }
            }
        }
    }
}

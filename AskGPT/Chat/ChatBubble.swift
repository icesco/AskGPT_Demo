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
    let text: String
  
    var body: some View {
        Markdown(text)
            .markdownTextStyle(textStyle: {
                ForegroundColor(isSender ? .white : .primary)
            })
            .markdownCodeSyntaxHighlighter(MyCodeHighlighter())
            .padding(12)
            .background(ChatBubbleShape().fill(isSender ? Color.accentColor : Color(.secondarySystemFill)).rotation3DEffect(.radians( isSender ? 0 :.pi), axis: (0.0, 1.0, 0.0)))
            .frame(maxWidth: .infinity, alignment: isSender ? .trailing : .leading)
            .padding()
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           
            ScrollView {
                LazyVStack {
                    ChatBubble(isSender: false, text: "Rose\n\n\nrosse\n\ncadono")
                    ChatBubble(isSender: true, text: "Hello world\n\nI'm going a capo!")
                    ChatBubble(isSender: false, text: "\n\nHello world!\n\nCiao ciao **bold text**")
                    ChatBubble(isSender: true, text: "Hello world! *This is italics*")
                    ChatBubble(isSender: false, text: "```swift\nstruct Time: Codable {\n\tvar item = \"Ciao\"\n}\n```")
                }
            }
        }
    }
}

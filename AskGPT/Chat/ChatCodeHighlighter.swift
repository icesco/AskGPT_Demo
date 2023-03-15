//
//  ChatCodeHighlighter.swift
//  AskGPT
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import MarkdownUI
import SwiftUI
import Codehighlighter

struct ChatCodeHighlighter: CodeSyntaxHighlighter {
    
    func highlightCode(_ code: String, language: String?) -> Text {
        let code = NSMutableAttributedString.parseCode(text: code, fontSize: 15, using: AvailableCodeBlockTheme.xcode.theme)
        return Text(AttributedString(code))
    }
}

//
//  NSMutableAttributedString + code highlight.swift
//  AttributedStringStyledMarkdown
//
//  Created by Francesco Bianco on 17/01/22.
//

import Foundation
import UIKit
import MarkdownUI
import SwiftUI

struct MyCodeHighlighter: CodeSyntaxHighlighter {
    
    func highlightCode(_ code: String, language: String?) -> Text {
        let code = NSMutableAttributedString.parseCode(text: code, fontSize: 15, using: XCodeTheme())
        return Text(AttributedString(code))
    }
}

extension NSMutableAttributedString {
    
    private static let keywordsRegex: String = #"(\b(func|function|fun|def|define|fn|return|true|false|yes|no|export|import|include|from|extends|if|extension|elsif|elif|else|endif|fi|for|while|rescue|yield|alias|operator|foreach|do|unless|guard|defer|in|var|let|get|set|Set|Array|const|async|await|define|make|class|override|struct|protocol|abstract|module|enum|do|catch|try|throw|throws|typealias|associatedtype|typedef|final|inherit|default|internal|dynamic|implements|required|unowned|public|protected|private|static|global|this|self|weak|strong|switch|case|break|continue|finally|lambda|with|not|as|and|or|chan|select|range|interface|inherits|type|default|fallthrough|namespace|stop|goto|val|end|new|nil|bool|boolean|char|array|dictionary|slice|sequence|map|hashmap|hashtable|int|integer|byte|by|actor|short|long|unsigned|float|double|super|void|Data|null|when|lazy|isolated|nonisolated|init|some)\b)|(\b\@\w+\b)"#
    
    private static let classes: String = #"[^\@]\b[A-Z].*?\b"#
    
    private static let stringRegex: String = #""[^"\\]*(?:\\.[^"\\]*)*""#
    
    private static let operators: String = #"([\+\-\*/=\<\>\(\)(&\|?\?\.])"#
    
    private static let methodNames: String = #"(\w+)(?=\()"#
    
    private static let numbers: String = #"(\b[0-9]+(\.[0-9]+)?(e[+-]?[0-9]+)?\w?\b)|(\b[0-9]x\w+\b)"#
    
    private static let singleLineComments: String = #"(\/\/.*$)|(#.*$)"#
    
    private static var defaultFont: UIFont = UIFont.monospacedSystemFont(ofSize: 15, weight: .regular)
    
    public static func parseCode(text: String,
                                 fontSize: CGFloat,
                                 using theme: CodeBlockTheme) -> NSMutableAttributedString {
        
        defaultFont = UIFont.monospacedSystemFont(ofSize: fontSize, weight: .regular)
        let keywordsRegex = try? NSRegularExpression(pattern: keywordsRegex, options: [.useUnicodeWordBoundaries, .caseInsensitive])
        
        let classesNamesRegex = try? NSRegularExpression(pattern: classes)
        
        let methodNamesRegex = try? NSRegularExpression(pattern: methodNames, options: [.caseInsensitive])
        let operatorsRegex = try? NSRegularExpression(pattern: operators, options: [.caseInsensitive])
        let numbersRegex = try? NSRegularExpression(pattern: numbers, options: [.useUnicodeWordBoundaries])
        let stringRegex = try? NSRegularExpression(pattern: stringRegex, options: [.caseInsensitive])
        let singleLineComments = try? NSRegularExpression(pattern: singleLineComments, options: [.caseInsensitive, .anchorsMatchLines])
        
        var resultinString = NSMutableAttributedString(string: text.replacingOccurrences(of: "    ", with: "  ").replacingOccurrences(of: "\t", with: "  "), attributes: [.foregroundColor: theme.mainText, .font: defaultFont, .backgroundColor: theme.backgroundColor])
        addMatches(at: &resultinString, with: keywordsRegex, color: theme.keywords, traits: .traitBold)
        addMatches(at: &resultinString, with: methodNamesRegex, color: theme.functionNames)
        addMatches(at: &resultinString, with: operatorsRegex, color: theme.operators)
        addMatches(at: &resultinString, with: classesNamesRegex, color: theme.classes, traits: .traitBold)
        addMatches(at: &resultinString, with: numbersRegex, color: theme.numbers)
        addMatches(at: &resultinString, with: stringRegex, color: theme.strings)
        addMatches(at: &resultinString, with: singleLineComments, color: theme.comments, traits: .traitItalic)
        
        return resultinString
    }
    
    private static func addMatches(at resultingString: inout NSMutableAttributedString,
                                   with expression: NSRegularExpression?,
                                   color: UIColor,
                                   traits: UIFontDescriptor.SymbolicTraits? = nil) {
        let range = NSRange(location: 0, length: resultingString.string.utf16.count)
        let matches = expression?.matches(in: resultingString.string, options: [], range: range).drop(while: { result in
            result.range.length < 1
        })
        matches?.forEach { match in
            let range: NSRange
            range = match.range
            
            resultingString.addAttribute(.foregroundColor, value: color, range: range)
            if let trait = traits {
                resultingString.addAttribute(.font, value: defaultFont.apply(newTraits: trait), range: range)
            }
        }
    }
    
}

extension UIFont {
    func apply(newTraits: UIFontDescriptor.SymbolicTraits, newPointSize: CGFloat? = nil) -> UIFont {
        var existingTraits = fontDescriptor.symbolicTraits
        existingTraits.insert(newTraits)
        
        guard let newFontDescriptor = fontDescriptor.withSymbolicTraits(existingTraits) else { return self }
        return UIFont(descriptor: newFontDescriptor, size: newPointSize ?? pointSize)
    }
}

//
//  CodeBlockThemes.swift
//  AttributedStringStyledMarkdown
//
//  Created by Francesco Bianco on 17/01/22.
//

import Foundation

public enum AvailableCodeBlockTheme: String, CaseIterable {
    
    case solarized
    case xcode
    case dracula
    case paraiso = "Paraiso"
    case tomorrowNightBlue = "tomorrow night blue"
    case oneDarkPro = "One Dark Pro"
    case a11ydark = "A11Y Dark"
    case cobalt
    case hopscotch
    
    public var theme: CodeBlockTheme {
        switch self {
        case .xcode:
            return XCodeTheme()
        case .solarized:
            return SolarizedTheme()
        case .dracula:
            return DraculaTheme()
        case .paraiso:
            return ParaisoTheme()
        case .tomorrowNightBlue:
            return TomorrowNightBlueTheme()
        case .oneDarkPro:
            return OneDarkProTheme()
        case .a11ydark:
            return A11YDark()
        case .hopscotch:
            return Hopscotch()
        case .cobalt:
            return Cobalt()
        }
    }
}

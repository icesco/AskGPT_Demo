//
//  CodeBlockTheme.swift
//  AttributedStringStyledMarkdown
//
//  Created by Francesco Bianco on 17/01/22.
//

import Foundation
import UIKit

public protocol CodeBlockTheme {
    var mainText: UIColor { get }
    var functionNames: UIColor { get }
    var keywords: UIColor { get }
    var comments: UIColor { get }
    var strings: UIColor { get }
    var operators: UIColor { get }
    var classes: UIColor { get }
    var numbers: UIColor { get }
    var backgroundColor: UIColor { get }
}

public struct XCodeTheme: CodeBlockTheme {
    
    public var mainText: UIColor = .init(lightColor: "#000000", darkColor: "#ffffff")
    public var functionNames: UIColor = .init(lightColor: "#6C36A9", darkColor: "#41A1C0")
    public var keywords: UIColor = .init(lightColor: "#9B2393", darkColor: "#FF7AB2")
    public var comments: UIColor = .init(lightColor: "#536579", darkColor: "#6C7986")
    public var strings: UIColor = .init(lightColor: "#C41A16", darkColor: "#FC6A5D" )
    public var operators: UIColor = .init(lightColor: "#000000", darkColor: "#A79DF8")
    public var classes: UIColor = .init(lightColor: "#3900A0", darkColor: "#5DD8FF" )
    public var numbers: UIColor = .init(lightColor: "#1C00CF", darkColor: "#A79DF8")
    public var backgroundColor: UIColor = .init(lightColor: "#F5F5F5", darkColor: "#292A30")
}

public struct SolarizedTheme: CodeBlockTheme {
    public var mainText: UIColor = .init(lightColor: "#000000", darkColor: "#708284")
    public var functionNames: UIColor = .init(lightColor: "#595AB7", darkColor: "#268BD2")
    public var keywords: UIColor = .init(lightColor: "#738A05", darkColor: "#738A05")
    public var comments: UIColor = .init(lightColor: "#819090", darkColor: "#657B83")
    public var strings: UIColor = .init(lightColor: "#259286", darkColor: "#259286")
    public var operators: UIColor = .init(lightColor: "#536870", darkColor: "#A79DF8")
    public var classes: UIColor = .init(lightColor: "#A57706", darkColor: "#A57706")
    public var numbers: UIColor = .init(lightColor: "#259286", darkColor: "#259286")
    public var backgroundColor: UIColor = .init(lightColor: "#fdf6e3", darkColor: "#002b36")
}

public struct DraculaTheme: CodeBlockTheme {
    public var mainText: UIColor = .init(lightColor: "#ffffff", darkColor: "#ffffff")
    public var functionNames: UIColor = .init(lightColor: "#20E3B2", darkColor: "#20E3B2")
    public var keywords: UIColor = .init(lightColor: "#FF79C6", darkColor: "#FF79C6")
    public var comments: UIColor = .init(lightColor: "#6272A4", darkColor: "#6272A4")
    public var strings: UIColor = .init(lightColor: "#F1FA8C", darkColor: "#F1FA8C")
    public var operators: UIColor = .init(lightColor: "#50FA7B", darkColor: "#50FA7B")
    public var classes: UIColor = .init(lightColor: "#BD93F9", darkColor: "#BD93F9")
    public var numbers: UIColor = .init(lightColor: "#BD93F9", darkColor: "#BD93F9")
    public var backgroundColor: UIColor = .init(lightColor: "#282A36", darkColor: "#282A36")
}

public struct TomorrowNightBlueTheme: CodeBlockTheme {
    public var mainText: UIColor = .init(lightColor: "#D8D8D8", darkColor: "#D8D8D8")
    public var functionNames: UIColor = .init(lightColor: "#FFFFFF", darkColor: "#FFFFFF")
    public var keywords: UIColor = .init(lightColor: "#FFFFFF", darkColor: "#FFFFFF")
    public var comments: UIColor = .init(lightColor: "#C7DD0C", darkColor: "#C7DD0C")
    public var strings: UIColor = .init(lightColor: "#FFC600", darkColor: "#FFC600")
    public var operators: UIColor = .init(lightColor: "#50FA7B", darkColor: "#50FA7B")
    public var classes: UIColor = .init(lightColor: "#D25252", darkColor: "#D25252")
    public var numbers: UIColor = .init(lightColor: "#7FB347", darkColor: "#7FB347")
    public var backgroundColor: UIColor = .init(lightColor: "#043263", darkColor: "#043263")
}

public struct OneDarkProTheme: CodeBlockTheme {
    public var mainText: UIColor = "#B2BAC6".hexStringToUIColor()
    public var functionNames: UIColor = "#D46870".hexStringToUIColor()
    public var keywords: UIColor = "#C979DF".hexStringToUIColor()
    public var comments: UIColor = "#7f848e".hexStringToUIColor()
    public var strings: UIColor = "#9ECA7E".hexStringToUIColor()
    public var operators: UIColor = "#56B6C3".hexStringToUIColor()
    public var classes: UIColor = "#E6C17C".hexStringToUIColor()
    public var numbers: UIColor = "#D79E69".hexStringToUIColor()
    public var backgroundColor: UIColor = "#282c34".hexStringToUIColor()
}

public struct ParaisoTheme: CodeBlockTheme {
    public var mainText: UIColor = .init(lightColor: "#4f424c", darkColor: "#a39e9b")
    public var functionNames: UIColor = .init(lightColor: "#06b6ef", darkColor: "#06b6ef")
    public var keywords: UIColor = .init(lightColor: "#815ba4", darkColor: "#815ba4")
    public var comments: UIColor = .init(lightColor: "#8d8687", darkColor: "#776e71")
    public var strings: UIColor = .init(lightColor: "#48b685", darkColor: "#48b685")
    public var operators: UIColor = .init(lightColor: "#4f424c", darkColor: "#a39e9b")
    public var classes: UIColor = .init(lightColor: "#f99b15", darkColor: "#FCCC4A")
    public var numbers: UIColor = .init(lightColor: "#f99b15", darkColor: "#f99b15")
    public var backgroundColor: UIColor = .init(lightColor: "#e7e9db", darkColor: "#2f1e2e")
}

public struct A11YDark: CodeBlockTheme {
    public var mainText: UIColor = "#FEFFF9".hexStringToUIColor()
    public var functionNames: UIColor = "#FBDA49".hexStringToUIColor()
    public var keywords: UIColor = "#F3A683".hexStringToUIColor()
    public var comments: UIColor = "#D6D3B1".hexStringToUIColor()
    public var strings: UIColor = "#FEE04B".hexStringToUIColor()
    public var operators: UIColor = "#BCE85B".hexStringToUIColor()
    public var classes: UIColor = "#F5D447".hexStringToUIColor()
    public var numbers: UIColor = "#D4C3D9".hexStringToUIColor()
    public var backgroundColor: UIColor = "#2A2B2A".hexStringToUIColor()
}

public struct Cobalt: CodeBlockTheme {
    public var mainText: UIColor = "#FFFFFF".hexStringToUIColor()
    public var functionNames: UIColor = "#598F8F".hexStringToUIColor()
    public var keywords: UIColor = "#FEF894".hexStringToUIColor()
    public var comments: UIColor = "#3B87F8".hexStringToUIColor()
    public var strings: UIColor = "#74DE41".hexStringToUIColor()
    public var operators: UIColor = "#FFFFFF".hexStringToUIColor()
    public var classes: UIColor = "#A1D2FF".hexStringToUIColor()
    public var numbers: UIColor = "#F98BE3".hexStringToUIColor()
    public var backgroundColor: UIColor = "#0A213E".hexStringToUIColor()
}

public struct Hopscotch: CodeBlockTheme {
    public var mainText: UIColor = "#A5A1A5".hexStringToUIColor()
    public var functionNames: UIColor = "#F9D16E".hexStringToUIColor()
    public var keywords: UIColor = "#B9647C".hexStringToUIColor()
    public var comments: UIColor = "#999699".hexStringToUIColor()
    public var strings: UIColor = "#9EC555".hexStringToUIColor()
    public var operators: UIColor = "#A5A1A5".hexStringToUIColor()
    public var classes: UIColor = "#D35452".hexStringToUIColor()
    public var numbers: UIColor = "#B9647C".hexStringToUIColor()
    public var backgroundColor: UIColor = "#312930".hexStringToUIColor()
}

public extension UIColor {
    
    convenience init(lightColor: String, darkColor: String) {
        self.init { collection in
            if collection.userInterfaceStyle == .light {
                return lightColor.hexStringToUIColor()
            } else {
                return darkColor.hexStringToUIColor()
            }
        }
    }
    
}

extension String {
    
    func hexStringToUIColor() -> UIColor {
        var cString: String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return .systemBlue
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

//
//  File.swift
//  
//
//  Created by Francesco Bianco on 28/02/23.
//

import Foundation
#if canImport(SwiftUI)
import SwiftUI

// MARK: - API

public extension String {
    
    func color(defaultColor: UIColor = .systemBlue) -> Color {
        return Color(hexString: self) ?? defaultColor.color
    }
    
    func uiColor(defaultColor: UIColor = .systemBlue) -> UIColor {
        return UIColor(hexString: self) ?? defaultColor
    }
    
}

// MARK: - Helpers

struct ColorRGB {
    var r, g, b, a: CGFloat
}

extension Color {
    
    init?(hexString: String) {
        guard let rgbData = hexString.rgbaData else {
            return nil
        }
        self.init(.sRGB,
                  red: Double(rgbData.r),
                  green: Double(rgbData.g),
                  blue: Double(rgbData.b),
                  opacity: Double(rgbData.a)
        )
    }
}

public extension UIColor {
    
    var color: Color {
        return Color(self)
    }
    
    convenience init?(hexString: String) {
        guard let rgbaData = hexString.rgbaData else {
            return nil
        }
        self.init(
            red: rgbaData.r,
            green: rgbaData.g,
            blue: rgbaData.b,
            alpha: rgbaData.a)
    }
    
}

// MARK: - String Helper

extension String {
    
    var rgbaData: ColorRGB? {
        guard hasPrefix("#") else {
            return nil
        }
        
        let start = self.index(self.startIndex, offsetBy: 1)
        let hexColor = String(self[start...]) // Swift 4
        
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }
        
        switch hexColor.count {
        case 8:
            return ColorRGB(r: CGFloat((hexNumber & 0xff000000) >> 24) / 255,
                            g: CGFloat((hexNumber & 0x00ff0000) >> 16) / 255,
                            b: CGFloat((hexNumber & 0x0000ff00) >> 8)  / 255,
                            a: CGFloat( hexNumber & 0x000000ff)        / 255)
            
        case 6:
            return ColorRGB(r: CGFloat((hexNumber & 0xff0000) >> 16) / 255,
                            g: CGFloat((hexNumber & 0x00ff00) >> 8)  / 255,
                            b: CGFloat((hexNumber & 0x0000ff))       / 255,
                            a: 1.0)
        default:
            return nil
        }
    }
}

#endif

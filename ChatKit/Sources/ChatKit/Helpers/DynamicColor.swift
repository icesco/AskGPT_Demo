//
//  File.swift
//  
//
//  Created by Francesco Bianco on 28/02/23.
//

import Foundation

#if canImport(UIKit)
import UIKit

@propertyWrapper public struct DynamicUIColor {
    
    private var color: UIColor
    
    public var wrappedValue: UIColor {
        return color
    }
    
    init(_ hexLightColor: String,
         _ hexDarkColor: String) {
        
        self.color = UIColor(dynamicProvider: { traitColletion in
            if traitColletion.userInterfaceStyle == .dark {
                return hexDarkColor.uiColor()
            } else {
                return hexLightColor.uiColor()
            }
        })
    }
}

#endif

#if canImport(SwiftUI)
import SwiftUI

@propertyWrapper public struct DynamicColor {
    
    private var color: Color
    
    public var wrappedValue: Color {
        return color
    }
    
    init(_ hexLightColor: String,
         _ hexDarkColor: String) {
        
        self.color = UIColor(dynamicProvider: { traitColletion in
            if traitColletion.userInterfaceStyle == .dark {
                return hexDarkColor.uiColor()
            } else {
                return hexLightColor.uiColor()
            }
        }).color
    }
}

#endif


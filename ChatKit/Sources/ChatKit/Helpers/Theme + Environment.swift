//
//  Theme + Environment.swift
//  
//
//  Created by Francesco Bianco on 28/02/23.
//

import Foundation
#if canImport(SwiftUI)
import SwiftUI

public struct ThemeEnvironmentKey: EnvironmentKey {
    public static var defaultValue: Value = DefaultBubbleTheme()
    
    public typealias Value = ChatTheme
    
}

public extension EnvironmentValues {
    var theme: ChatTheme {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}


#endif

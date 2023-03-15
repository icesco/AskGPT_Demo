//
//  File.swift
//  
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import SwiftUI

public protocol ChatTheme {
    
    var name: String { get }
    var senderBackgroundColor: Color { get }
    var senderTextColor: Color { get }
    var issuerBackgroundColor: Color { get }
    var issuerTextColor: Color { get }
    
}

public struct DefaultBubbleTheme: ChatTheme {
    public var name: String = "Default"
    
    public var senderBackgroundColor: Color = .blue
    
    public var senderTextColor: Color = .white
    
    public var issuerBackgroundColor: Color = Color(.secondarySystemFill)
    
    public var issuerTextColor: Color = .primary
}

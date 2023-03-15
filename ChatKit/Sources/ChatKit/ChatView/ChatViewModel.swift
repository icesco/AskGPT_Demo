//
//  File.swift
//  
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation

public protocol ChatViewModel: ObservableObject {
    
    associatedtype Message: Identifiable & Equatable
    
    func sendMessage(with text: String) async
}

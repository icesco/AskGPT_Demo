//
//  Message.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import Foundation

struct Message: Identifiable, Hashable {
    
    let text: String
    let isSender: Bool
    let id: UUID = .init()
    var isError: Bool = false
    
}

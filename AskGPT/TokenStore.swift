//
//  TokenStore.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import Foundation
import KeychainSwift

final class TokenStore {
    
    private let keychain: KeychainSwift
    private static let tokenKey: String = "savedToken"
    
    init() {
        self.keychain = KeychainSwift()
        keychain.accessGroup = "group.francescobianco.ai.askgpt"
    }
    
    func token() -> String? {
        return keychain.get(Self.tokenKey)
    }
    
    
    func setToken(_ token: String?) -> Bool {
        guard let token else {
            return keychain.delete(Self.tokenKey)
        }
        
        return keychain.set(token, forKey: Self.tokenKey, withAccess: .accessibleAfterFirstUnlock)
    }
    
}

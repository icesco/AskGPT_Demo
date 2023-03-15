//
//  AppViewModel.swift
//  AskGPT
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import SwiftUI

final class AppViewModel: ObservableObject {
    
    @Published private(set) var appTint: Color = .accentColor
    @Published private(set) var isNotReadyToChat: Bool = true
    
    var chatViewModel: ChatViewModel = .init()
    private let store = TokenStore()
    
    private let colors: [Color] = [
        .red,
        .orange,
        .blue,
        .green,
        .indigo,
        .purple,
        .pink
    ]
    
    init() {
        if let token = store.token() {
            self.isNotReadyToChat = false
            chatViewModel.login(token)
        } else {
            self.isNotReadyToChat = true
            chatViewModel.login(nil)
        }
    }
    
    func login(_ token: String) {
        guard store.setToken(token) else {
            return
        }
        chatViewModel.login(token)
        self.isNotReadyToChat = false
    }
    
    func logout() {
        guard store.setToken(nil) else {
            return
        }
        self.isNotReadyToChat = true
    }
    
    func newAccent() {
        self.appTint = colors.randomElement()!
    }
}

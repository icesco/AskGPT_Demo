//
//  AppViewModel.swift
//  AskGPT
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import SwiftUI
import OpenAISwift

final class AppViewModel: ObservableObject {
    
    @Published private(set) var appTint: Color = .accentColor
    @Published private(set) var isNotReadyToChat: Bool = true
    
    let chatViewModel: OpenAIChatViewModel
    private var openAI: OpenAISwift = .init(authToken: "")
    private let store = TokenStore()
    
    init() {
        if let token = store.token() {
            self.isNotReadyToChat = false
            let open = OpenAISwift(authToken: token)
            self.openAI = open
            self.chatViewModel = .init(openAI: open)
        } else {
            self.openAI = OpenAISwift(authToken: "")
            self.chatViewModel = .init(openAI: OpenAISwift(authToken: ""))
            self.isNotReadyToChat = true
        }
    }
    
    func login(_ token: String) {
        guard store.setToken(token) else {
            return
        }
        self.openAI = OpenAISwift(authToken: token)
        chatViewModel.setOpenAI(openAI)
        self.isNotReadyToChat = false
    }
    
    func logout() {
        guard store.setToken(nil) else {
            return
        }
        self.isNotReadyToChat = true
        self.openAI = OpenAISwift(authToken: "")
    }
}

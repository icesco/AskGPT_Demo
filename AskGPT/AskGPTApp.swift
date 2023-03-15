//
//  AskGPTApp.swift
//  AskGPT
//
//  Created by Francesco Bianco on 14/03/23.
//

import SwiftUI

@main
struct AskGPTApp: App {
    
    @StateObject private var appViewModel: AppViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    ConversationView()
                        .environmentObject(appViewModel)
                        .environmentObject(appViewModel.chatViewModel)
                }
                .tint(appViewModel.appTint)
                .tabItem {
                    Label("Chat", systemImage: "message.fill")
                }
                
                NavigationStack {
                    SettingsView()
                }
                .environmentObject(appViewModel)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            }
        }
    }
}

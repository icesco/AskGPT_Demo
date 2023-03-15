//
//  SettingsView.swift
//  AskGPT
//
//  Created by Francesco Bianco on 15/03/23.
//

import Foundation
import SwiftUI


struct SettingsView: View {
    
    @State private var apiKey: String = ""
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        Form {
            if appViewModel.isNotReadyToChat {
                SecureField("API Key", text: $apiKey)
                    .onSubmit {
                        guard !apiKey.isEmpty else {
                            return
                        }
                        
                        appViewModel.login(apiKey)
                    }
            }
            
            if !appViewModel.isNotReadyToChat {
                Button(role: .destructive) {
                    appViewModel.logout()
                } label: {
                    Label("Delete Token", systemImage: "trash")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }.navigationTitle(Text("Activate"))
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

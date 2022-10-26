//
//  MultiplicationTablesAppApp.swift
//  MultiplicationTablesApp
//
//  Created by Romy Shvagir
//

import SwiftUI

@main
struct MultiplicationTablesAppApp: App {
    
    @StateObject var launchScreenManager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                StartView()
                if launchScreenManager.state != .completed {
                    LaunchScreenView()
                }
            }
            .environmentObject(launchScreenManager)
        }
    }
}

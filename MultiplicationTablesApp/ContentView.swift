//
//  ContentView.swift
//  MultiplicationTablesApp
//
//  Created by Romy Shvagir
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    launchScreenManager.dismiss()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenManager())
    }
}

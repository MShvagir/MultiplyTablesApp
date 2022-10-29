//
//  LaunchScreenView.swift
//  MultiplicationTablesApp
//
//  Created by Romy Shvagir
//

import SwiftUI

struct LaunchScreenView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State private var firstPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false
    @State private var animationAmount: Double = 1.0
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color("launchScreenBackground")
            VStack {
                Image("owl")
                    .scaleEffect(firstPhaseIsAnimating ? 0.6 : 1)
                    .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height / 4 : 1)
                Text("Practice with me")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .padding(.top, 10)
                    .scaleEffect(animationAmount)
                    .animation(
                        .spring(),
                        value: animationAmount)
            }
        }
        .ignoresSafeArea()
        .onReceive(timer) { input in
            switch launchScreenManager.state {
            case .first:
                withAnimation(.spring()) {
                    firstPhaseIsAnimating.toggle()
                }
            case .second:
                withAnimation(.easeInOut) {
                    secondPhaseIsAnimating.toggle()
                }
            default: break
            }
        }
        .opacity(secondPhaseIsAnimating ? 0 : 1)
        .onAppear {
            animationAmount = 2
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenManager())
    }
}

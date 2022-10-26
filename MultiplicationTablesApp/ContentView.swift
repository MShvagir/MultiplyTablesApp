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
        NavigationView {
            ZStack {
                Color("launchScreenBackground")
                    VStack {
                        Spacer()
                        HStack {
                            Image("owl")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.leading, 20)
                            ZStack {
                                Image(systemName: "bubble.left")
                                    .resizable()
                                    .foregroundColor(Color(#colorLiteral(red: 0.9206781387, green: 0.8076726794, blue: 0.7184258103, alpha: 1)))
                                    .frame(width: 270, height: 200)
                                Text("Hello! I'm Ollie the owl. Let's practice the multiplication table together :)")
                                    .padding(.top, 10)
                                    .padding(20)
                                    .frame(width: 250, height: 200, alignment: .top)
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                            .offset(x: -25, y: -120)
                        }
                        Button {
                            //
                        } label: {
                            Text("Start".uppercased())
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color.white)
                                .padding()
                                .padding(.horizontal, 10)
                                .background(
                                Capsule()
                                    .stroke(Color.white, lineWidth: 2.0)
                                )
                        }
                        Spacer()
                    }
            }
            .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            launchScreenManager.dismiss()
                        }
                }
                    .navigationTitle("Home")
                    .navigationBarHidden(true)
                    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenManager())
    }
}

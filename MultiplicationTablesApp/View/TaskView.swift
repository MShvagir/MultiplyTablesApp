//
//  TaskView.swift
//  MultiplicationTablesApp
//
//  Created by Romy Shvagir
//

import SwiftUI

struct TaskView: View {
    
    @State private var userAnswer: String = ""
    
    var body: some View {
        ZStack {
            Color("launchScreenBackground")
            VStack {
                RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(.purple, lineWidth: 3)
                        .background(.white)
                        .cornerRadius(25)
                    .frame(width: 200, height: 190)
                Image(systemName: "multiply")
                    .foregroundColor(.white)
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .padding()
                RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(.purple, lineWidth: 3)
                        .background(.white)
                        .cornerRadius(25)
                    .frame(width: 200, height: 190)
                Image(systemName: "equal")
                    .foregroundColor(.white)
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .padding()
                TextField("Enter your answer", text: $userAnswer)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle)
                    .foregroundColor(.mint)
                    //.frame(height: 200)
                    .padding(.horizontal, 120)
                Divider().padding(10)
            }
        }
        .ignoresSafeArea()
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

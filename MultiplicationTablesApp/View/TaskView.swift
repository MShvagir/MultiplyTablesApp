//
//  TaskView.swift
//  MultiplicationTablesApp
//
//  Created by Romy Shvagir
//

import SwiftUI

struct TaskView: View {

    let userNumber: Int
    let numberOfQuestions: Int
    
    @State private var randomNumber: Int = Int.random(in: 2...10)
    @State private var userAnswer: String = ""
    @State private var isAlert: Bool = false
    @State private var title: String = ""
    @State private var totalScore = UserDefaults.standard.integer(forKey: "Tap")
    @State private var isTouched: Bool = false
    @State private var isOver: Bool = false
    @State private var counterOfQuestions: Int = 0
   
    
    var body: some View {
        ZStack {
            Color("launchScreenBackground")
            VStack(alignment: .center, spacing: 3) {
                HStack {
                Image("owl")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .topTrailing)
                   Text("\(totalScore)")
                        .font(.largeTitle)
                }
                Text("Score".uppercased())
                    .font(.headline)
            }
            .foregroundColor(.white)
            .offset(x: 150, y: -370)
            VStack(spacing: 5) {
                ZStack {
                    Image("giraffe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160)
                        .offset(x: -90, y: -40)
                RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color(#colorLiteral(red: 0.8221660256, green: 0.1875290871, blue: 0.03009820357, alpha: 1)), lineWidth: 3)
                        .background(.white)
                        .cornerRadius(25)
                    .frame(width: 170, height: 170)
                    withAnimation(.spring()) {
                    Text("\(userNumber)")
                        .font(.system(size: 130, weight: .bold, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 0.8221660256, green: 0.1875290871, blue: 0.03009820357, alpha: 1)))
                    }
                    .rotationEffect(Angle(degrees: isTouched ? 360 : 0))
                }
                Image(systemName: "multiply")
                    .foregroundColor(.white)
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .padding()
                ZStack {
                    Image("rabbit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160)
                        .offset(x: 90, y: -40)
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color(#colorLiteral(red: 0.8221660256, green: 0.1875290871, blue: 0.03009820357, alpha: 1)), lineWidth: 3)
                            .background(.white)
                            .cornerRadius(25)
                        .frame(width: 170, height: 170)
                    withAnimation(.spring()) {
                    Text("\(randomNumber)")
                        .font(.system(size: 130, weight: .bold, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 0.8221660256, green: 0.1875290871, blue: 0.03009820357, alpha: 1)))
                    }
                    .rotationEffect(Angle(degrees: isTouched ? 360 : 0))
                }
                Image(systemName: "equal")
                    .foregroundColor(.white)
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .padding()
                TextField("Enter your answer", text: $userAnswer)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(#colorLiteral(red: 1, green: 0.6679218411, blue: 0.4736531973, alpha: 1)).opacity(0.7).cornerRadius(25))
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.horizontal, 70)
                Divider().padding(10)
                Button {
                     multiply(userAnswer: userAnswer)
                    withAnimation(.easeOut) {
                    isAlert.toggle()
                    isTouched.toggle()
                    }
                    UserDefaults.standard.set(self.totalScore, forKey: "Tap")
                } label: {
                    Text("Check".uppercased())
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(
                        Capsule()
                            .stroke(Color.white, lineWidth: 2.0)
                        )
                }
                .padding(.top, 5)
                .padding(.bottom, -50)
            }
        }
        .ignoresSafeArea()
        .alert("You are \(title)", isPresented: $isAlert) {
            Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(totalScore)")
        }
        .alert("Good job, my friend", isPresented: $isOver) {
                    Button("OK", action: reset)
                } message: {
                    Text("Game over! Play again :)")
                }
    }
    
    func multiply(userAnswer: String) {
        let result = userNumber * randomNumber
        if result == Int(userAnswer) {
            title = "right"
            totalScore += 1
        } else {
            title = "wrong"
            totalScore -= 1
        }
        counterOfQuestions += 1
        if counterOfQuestions == numberOfQuestions {
            isOver.toggle()
        }
    }
    
    func askQuestion() {
        randomNumber = Int.random(in: 2...10)
        userAnswer = ""
    }
    
    func reset() {
        totalScore = 0
        counterOfQuestions = 0
        askQuestion()
        UserDefaults.standard.set(self.totalScore, forKey: "Tap")
    }
}



struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(userNumber: 3, numberOfQuestions: 5)
    }
}



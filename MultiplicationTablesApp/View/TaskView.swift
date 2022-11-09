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
    @State private var totalScore = UserDefaults.standard.integer(forKey: "Score")
    @State private var isTouched: Bool = false
    @State private var isOver: Bool = false
    @State private var counterOfQuestions: Int = 0
    @State private var isResetedTotalScore: Bool = false
    @State private var isAnimating: Bool = false

   
   
    
    var body: some View {
        ZStack {
            Color("launchScreenBackground")
                .ignoresSafeArea()
            VStack {
            VStack {
                Button {
                    isResetedTotalScore.toggle()
                } label: {
                    Image("owl")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 30)
                    Text("\(totalScore)")
                        .font(.largeTitle)
                }
                Text("Total Score".uppercased())
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .confirmationDialog("Are you sure?", isPresented: $isResetedTotalScore) {
                Button("Reset", role: .destructive) {
                    resetTotalScore()
                }
            } message: {
                Text("Reset your score?")
            }
            VStack(spacing: 5) {
                ZStack {
                    PetView(pet: "giraffe", x: -90, y: -40)
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color("Bordo"), lineWidth: 3)
                        .modifier(RoundedRectangleModifier())
                    Text("\(userNumber)")
                        .font(.system(size: 110, weight: .bold, design: .rounded))
                        .foregroundColor(Color("Bordo"))
                        .rotationEffect(Angle(degrees: isTouched ? 360 : 0))
                }
                Image(systemName: "multiply")
                    .modifier(SignModifier())
                ZStack {
                    PetView(pet: "rabbit", x: 80, y: -40)
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color("Bordo"), lineWidth: 3)
                        .modifier(RoundedRectangleModifier())
                    Text("\(randomNumber)")
                        .font(.system(size: 110, weight: .bold, design: .rounded))
                        .foregroundColor(Color("Bordo"))
                        .rotationEffect(Angle(degrees: isTouched ? 360 : 0))
                }
                Image(systemName: "equal")
                    .modifier(SignModifier())
                TextField("Enter your answer", text: $userAnswer)
                    .keyboardType(.numberPad)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color("LightOrange").opacity(0.6).cornerRadius(25))
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.horizontal, 70)
                    .padding(20)
                Divider()
                    .padding(.bottom, 10)
                Button {
                    multiply(userAnswer: userAnswer)
                    UserDefaults.standard.set(self.totalScore, forKey: "Score")
                    withAnimation(.easeOut) {
                        isAlert.toggle()
                        isTouched.toggle()
                    }
                } label: {
                    Text("Check".uppercased())
                        .font(.title2)
                        .modifier(ButtonModifier())
                }
                .disabled(userAnswer == "" ? true : false)
            }
            .scaleEffect(isAnimating ? 1 : 0.6)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .alert("You are \(title)", isPresented: $isAlert) {
            Button {
                withAnimation(.spring()) {
                askQuestion()
                isAnimating.toggle()
                }
            } label: {
                Text("Continue")
            }
            .transition(.scale)
        } message: {
                Text("You answered \(counterOfQuestions) out of \(numberOfQuestions)")
        }
        .alert("Good job, my friend", isPresented: $isOver) {
                    Button("OK", action: reset)
                } message: {
                    Text("Game over! You answered \(counterOfQuestions) questions. Play again :)")
                }
        .onAppear {
            withAnimation(.default) {
                isAnimating.toggle()
            }
        }
        .onDisappear {
            counterOfQuestions = 0
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
        isAnimating.toggle()
    }
    
    func reset() {
        counterOfQuestions = 0
        askQuestion()
        isAlert = false
        isAnimating.toggle()
    }
    
    func resetTotalScore() {
        totalScore = 0
        UserDefaults.standard.set(self.totalScore, forKey: "Score")
    }
}


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(userNumber: 3, numberOfQuestions: 5)
    }
}



struct PetView: View {
    
    var pet: String
    var x: CGFloat
    var y: CGFloat
    
    var body: some View {
        Image(pet)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 160)
            .offset(x: x, y: y)
    }
}

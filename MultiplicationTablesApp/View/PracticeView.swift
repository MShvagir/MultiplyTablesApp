//
//  PracticeView.swift
//  MultiplicationTablesApp
//
//  Created by Romy Shvagir
//

import SwiftUI

struct PracticeView: View {
    
    let questions = [5, 10, 20]
    
    @State private var userNumber: Int = 4
    @State private var isTouched = false
    @State private var numberOfQuestions: Int = 10
    @State private var isAnimating: Bool = false
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Bordo"))
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
            ZStack {
                Color("launchScreenBackground")
                VStack {
                    Spacer()
                Text("\(userNumber)")
                    .foregroundColor(.white)
                    .font(.system(size: 200, weight: .bold, design: .rounded))
                    .scaleEffect(isTouched ? 1.25 : 1)
                    .rotationEffect(Angle(degrees: isTouched ? 360 : 0))
                    Text("Select a number to practice")
                    HStack {
                        Button {
                            withAnimation(.default) {
                            isTouched.toggle()
                            }
                            if userNumber > 2 {
                            userNumber -= 1
                            }
                        } label: {
                            Image("chick")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 33)
                            Text("-")
                                .bold()
                                .modifier(PlusMinusModifier())
                        }
                        .disabled(userNumber == 2 ? true : false)
                        Button {
                            withAnimation(.default) {
                            isTouched.toggle()
                            }
                            if userNumber < 10 {
                            userNumber += 1
                            }
                        } label: {
                            Text("+")
                                .bold()
                                .modifier(PlusMinusModifier())
                            Image("chicken")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 33)
                        }
                        .disabled(userNumber == 10 ? true : false)
                    }
                    .foregroundColor(.orange)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .padding(20)
                    .padding(.bottom, 50)
                    Divider()
                    Text("Select a number of questions")
                    Picker(selection: $numberOfQuestions) {
                        ForEach(questions, id: \.self) {
                            count in
                            Text(String(count)).tag(count)
                        }
                    } label: {
                        Text("Picker")
                    }
                    .padding(.horizontal)
                    .background(Color("LightOrange"))
                    .cornerRadius(21)
                    .padding(20)
                    .pickerStyle(.segmented)
                    Spacer()
                    NavigationLink {
                        TaskView(userNumber: userNumber, numberOfQuestions: numberOfQuestions)
                    } label: {
                        Text("Let's go".uppercased())
                            .font(.title2)
                            .modifier(ButtonModifier())
                    }
                    Spacer()
                }
                .font(.title)
                .foregroundColor(.white)
                .scaleEffect(isAnimating ? 1 : 0.6)
            }
           .ignoresSafeArea()
//           .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    self.navigationBarHidden(true)
//                }
//        }
            .onAppear {
                withAnimation(.default) {
                    isAnimating.toggle()
            }
        }
            .onDisappear {
                isAnimating.toggle()
            }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}

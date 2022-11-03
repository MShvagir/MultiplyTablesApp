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
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color(#colorLiteral(red: 0.8221660256, green: 0.1875290871, blue: 0.03009820357, alpha: 1)))
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
            ZStack {
                Color("launchScreenBackground")
                VStack {
                    Spacer()
                    withAnimation(.easeOut) {
                Text("\(userNumber)")
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 200, weight: .bold, design: .rounded))
                    .scaleEffect(isTouched ? 1.25 : 1)
                    .rotationEffect(Angle(degrees: isTouched ? 360 : 0))
                    Text("Select your number to practice")
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
                                .frame(width: 33, height: 33)
                            Text("-")
                                .font(.largeTitle)
                                .bold()
                                .frame(height: 25)
                                .frame(maxWidth: .infinity)
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
                                .font(.largeTitle)
                                .bold()
                                .frame(height: 25)
                                .frame(maxWidth: .infinity)
                            Image("chicken")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 33, height: 33)
                        }
                        .disabled(userNumber == 10 ? true : false)
                    }
                    .foregroundColor(.orange)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .padding()
                    .padding(.bottom, 50)
                    Divider()
                    Text("Select the number of questions")
                    Picker(selection: $numberOfQuestions) {
                        ForEach(questions, id: \.self) {
                            count in
                            Text(String(count)).tag(count)
                        }
                    } label: {
                        Text("Picker")
                    }
                    .padding(.horizontal)
                    .background(Color(#colorLiteral(red: 1, green: 0.6679218411, blue: 0.4736531973, alpha: 1)))
                    .cornerRadius(21)
                    .padding()
                    .pickerStyle(.segmented)
                    Spacer()
                    NavigationLink {
                        TaskView(userNumber: userNumber, numberOfQuestions: numberOfQuestions)
                    } label: {
                        Text("Let's go".uppercased())
                            .font(.caption)
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.8221660256, green: 0.1875290871, blue: 0.03009820357, alpha: 1)))
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                            Capsule()
                                .stroke(Color(#colorLiteral(red: 0.8221660256, green: 0.1875290871, blue: 0.03009820357, alpha: 1)), lineWidth: 2.0)
                            )
                            .background(.white)
                            .cornerRadius(25)
                    }
                    Spacer()
                }
                .font(.title)
                .foregroundColor(.white)
                .scaleEffect(isAnimating ? 1 : 0.6)
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    self.navigationBarHidden(true)
                }
        }
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    isAnimating.toggle()
            }
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct QuizView: View {
    
    @State private var isAlertPresented = false
    @State private var isCorrect = false
    @State private var isSheetPresented = false
    @State private var currentQuestion = 0
    @State private var correctAnswers = 0
    
    @Binding var isPresented: Bool
    @Binding var isQuizPresented: Bool
    
    var questions = [
        Question(title: "Free entry in 2 a wkly comp to win FA Cup final tkts 21st May 2005. Text FA to 87121 to receive entry question(std txt rate)T&C's apply!", option1: "Ham", option2: "Spam"),
        Question(title: "Hey there darling it's been 3 week's now and no word back! I'd like some fun you up for it still? Tb ok! Text +49 4302 3024 to send £1.50", option1: "Ham", option2: "Spam"),
        Question(title: "Just forced myself to eat a slice. I'm really not hungry tho. This sucks. Mark is getting worried. He knows I'm sick when I turn down pizza. Lol", option1: "Spam", option2: "Ham"),
        Question(title: "Thanks for your subscription to Ringtone UK your mobile will be charged £5/month Please confirm by replying YES or NO. If you reply NO you will not be charged", option1: "Ham", option2: "Spam"),
        Question(title: "Hello! How's you and how did saturday go? I was just texting to see if you'd decided to do anything tomo. Not that i'm trying to invite myself or anything!", option1: "Spam", option2: "Ham"),
        Question(title: "Your gonna have to pick up a $1 burger for yourself on your way home. I can't even move. Pain is killing me.", option1: "Spam", option2: "Ham"),
        Question(title: "As a valued customer, I am pleased to advise you that following recent review of your Mob No. you are awarded with a £1500 Bonus Prize, call 09066364589.", option1: "Ham", option2: "Spam"),
        Question(title: "Please call our customer service representative on 0800 169 6031 between 10am-9pm as you have WON a guaranteed £1000 cash or £5000 prize!", option1: "Ham", option2: "Spam"),
        Question(title: "GENT! We are trying to contact you. Last weekends draw shows that you won a £1000 prize GUARANTEED. Call 09064012160. Claim Code K52. Valid 12hrs only. 150ppm", option1: "Ham", option2: "Spam"),
        Question(title: "As I entered my cabin my PA said, 'Happy B'day Boss !!'. I felt special. She askd me 4 lunch. After lunch she invited me to her apartment. We went there.", option1: "Spam", option2: "Ham")
    ]
    
    var body: some View {
        ScrollView{
            HStack{
                Button(action: {
                    // Action to dismiss the AboutView by toggling the binding variable
                    isPresented.toggle()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size:20))
                        .foregroundColor(.white)
                        .frame(alignment: .leading)
                }
                Spacer()
                
            }
            .padding(50)

            ZStack{
                VStack{
                    Text("Text Message:")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center) // Align text in the center
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(questions[currentQuestion].title)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center) // Align text in the center
                        .fixedSize(horizontal: false, vertical: true)

                    HStack {
                        Button(action: {
                            didTapOption(1)
                        }) {
                            Text(questions[currentQuestion].option1)
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .padding(100)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.thinMaterial)
                                )
                        }
                        .padding(10)
                        
                        Button(action: {
                            didTapOption(2)
                        }) {
                            Text(questions[currentQuestion].option2)
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .padding(100)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.thinMaterial)
                                )
                        }
                        .padding(10)
                    } //where h stack ends
                } // where v stack ends
                .padding(100)
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text(isCorrect ? "Correct!" : "Wrong!"),
                          dismissButton: .default(Text("OK")){
                            currentQuestion += 1
                            if currentQuestion == questions.count {
                                // Show the score sheet
                                currentQuestion = 0
                                isSheetPresented = true
                            }
                    })
                }
                .sheet(isPresented: $isSheetPresented) {
                    ScoreView(isQuizPresented: $isSheetPresented, score: correctAnswers, totalScore: questions.count)
                }
            } // where the z stack ends
            .padding(50)

            
        }
    }
    
    func didTapOption(_ optionNumber: Int) {
        if optionNumber == 2 {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
    
}

#Preview {
    QuizView(isPresented: .constant(false), isQuizPresented: .constant(false))
}

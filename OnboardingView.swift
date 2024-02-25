//
//  OnboardingView.swift
//  WWDC24App
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var isonOnboardingView: Bool = true
    
    var body: some View {
        
        if isonOnboardingView {
            ZStack {
                LinearGradient(colors: [Color("AccentColor"), Color("SecondaryColor")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    
                    Image(systemName: "globe")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                    
                    Text("The Problem of Online Spam")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Spam is a significant issue worldwide, with 162 billion spam emails sent every day in 2022, with other 96.8% of people worldwide having received some form of spam messages. A reported $10 billion has been lost to scams in 2023.")
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("In Singapore where I'm from, scams and cybercrime continue to be a key concern, with a 69.4% rise in cases in 2023 compared to 2023. ")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()

                    Button(action: {
                        isonOnboardingView.toggle()
                    }) {
                        Text("Enter Spamshield")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
            }

//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            
//            Button{
//                isonOnboardingView.toggle()
//            } label: {
//                Text("Enter Spamshield")
//            }
        } else {
            HomeView()
        }
    }
}

#Preview {
    OnboardingView()
}

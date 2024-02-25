//
//  HomeView.swift
//  WWDC24App
//
//  Created by Ma Zhiyu on 23/2/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isMLViewPresented = false
    @State private var isAboutViewPresented = false
    @State private var isQuizViewActive = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            VStack(spacing: 20) {
                HStack{
                    Image(systemName: "lock.shield")
                        .foregroundColor(.white)
                        .font(.system(size: 80))
                    
                    Text("Spamshield")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 80))
                }
                
                Text("Your Shield against Spam.")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .padding(.bottom, 10)

                HStack {
                    
                    Button(action: {
                        isAboutViewPresented.toggle()
                    }) {
                        NavigationLinkButton(title: "About Spam", desc: "Find out more about spam, types of spam, why spam is dangerous, and how to protect oneself against falling for spam content.")
                    }
                    
                    Button(action: {
                        self.isQuizViewActive = true
                    }) {
                        NavigationLinkButton(title: "Quiz", desc: "Take the Quiz to find out how well you can detect spam.")// change later
                    }
                    
                }
                
                HStack {
                    
                    Button(action: {
                        isMLViewPresented.toggle()
                    }) {
                        NavigationLinkButton(title: "Spam Detector", desc: "Verify any potential spam messages using a Spam Identifier machine learning model.") // change later
                    }
                    
                    Button(action: {
                        self.isMLViewPresented.toggle()
                    }) {
                        NavigationLinkButton(title: "Report Spam", desc:"Report your spam messages.")// change later
                    }
                    
                }
                

            }
            .fullScreenCover(isPresented: $isMLViewPresented) {
                MLView(isPresented: $isMLViewPresented)
            }
            .fullScreenCover(isPresented: $isAboutViewPresented) {
                AboutView(isPresented: $isAboutViewPresented)
            }
            .fullScreenCover(isPresented: $isQuizViewActive) {
                QuizView()
            }
            .padding()
            
        }
    }
}

struct NavigationLinkButton: View {
    var title: String
    var desc: String
    
    var body: some View {
        ZStack {
            //            LinearGradient(colors: [Color("AccentColor"), Color("SecondaryColor")], startPoint: .topLeading, endPoint: .bottomTrailing)
            //                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 50)
                .overlay(LinearGradient(colors: [Color("AccentColor"), Color("SecondaryColor")], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(30))
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                
//                ZStack{
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(.thickMaterial)
//                    
//                    Text(desc)
//                        .foregroundColor(.white)
//                        .font(.system(size: 25))
//                        .padding()
//                }
                RoundedRectangle(cornerRadius: 20)
                    .fill(.thickMaterial)
                   /* .frame(maxWidth: .infinity, alignment: .leading)*/ // Align the RoundedRectangle to the left
                    .overlay(
                        Text(desc)
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .padding()
                    )
                    .padding()

            }
            .padding(50)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}

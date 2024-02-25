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
    @State private var isQuizViewPresented = false
    @State private var isReportViewPresented = false
  //  @State var show = false
    
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
                            NavigationLinkButton(title: "About Spam", desc: "Find out more about spam, types of spam, why spam is dangerous, and how to protect oneself against falling for spam.", imgName: "info.circle")
                        
                    }
                    
                    Button(action: {
                        self.isQuizViewPresented = true
                    }) {
                            NavigationLinkButton(title: "Spam Quiz", desc: "Take the Quiz to find out how well you can detect spam or ham (legitimate content).", imgName: "exclamationmark.bubble")
                        
                    }
                }
                
                HStack {
                    
                    Button(action: {
                        isMLViewPresented.toggle()
                    }) {
                            NavigationLinkButton(title: "Spam Detector", desc: "Verify any potential spam messages using a Spam Identifier machine learning model.", imgName: "doc.text.magnifyingglass")
                        
                    }
                    
                    Button(action: {
                        self.isReportViewPresented.toggle()
                    }) {
                            NavigationLinkButton(title: "Report Spam", desc:"Report your spam messages.", imgName: "flag.circle")

                    }
                }
                
            }
            .fullScreenCover(isPresented: $isMLViewPresented) {
                MLView(isPresented: $isMLViewPresented)
            }
            .fullScreenCover(isPresented: $isAboutViewPresented) {
                AboutView(isPresented: $isAboutViewPresented)
            }
            .fullScreenCover(isPresented: $isQuizViewPresented) {
                QuizView(isPresented: $isQuizViewPresented, isQuizPresented: $isQuizViewPresented)
            }
            .fullScreenCover(isPresented: $isReportViewPresented) {
                ReportView(isPresented: $isReportViewPresented, isSubmissionPresented: $isReportViewPresented)
            }
            .padding()
            
        }
    }
}

struct NavigationLinkButton: View {
    var title: String
    var desc: String
    var imgName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .overlay(LinearGradient(colors: [Color("AccentColor"), Color("SecondaryColor")], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(30))
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 0.5)
            
            VStack{
                HStack {
                    Image(systemName: imgName)
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                    Text(title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                }
                
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

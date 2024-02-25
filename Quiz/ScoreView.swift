//
//  SwiftUIView.swift
//  
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var isQuizPresented: Bool
    
    var score: Int
    var totalScore: Int
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isQuizPresented.toggle()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                
                Spacer()

                VStack{
                    Text("Your score:")
                        .font(.system(size: 25))
                        .padding()
                    Text("\(score)/\(totalScore)")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding()
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ScoreView(isQuizPresented: .constant(false), score: 15, totalScore: 20)
}

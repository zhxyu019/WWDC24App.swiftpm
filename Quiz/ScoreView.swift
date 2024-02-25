//
//  SwiftUIView.swift
//  
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct SwiftUIView: View {
    var score: Int
    var totalScore: Int
    
    var body: some View {
        ZStack {
            Color.yellow
            VStack {
                Text("Your score was:")
                Text("\(score)/\(totalScore)")
            }
        }
    }
}

#Preview {
    SwiftUIView(score: 15, totalScore: 20)
}

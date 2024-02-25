//
//  SwiftUIView.swift
//  
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct SubmittedView: View {
    
    @Binding var isSubmittedPresented: Bool
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button(action: {
                    isSubmittedPresented.toggle()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                .padding()
            }
            
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .font(.system(size: 60))
            
            Text("Report Submitted!")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    SubmittedView(isSubmittedPresented: .constant(false))
}

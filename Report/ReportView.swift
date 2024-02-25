//
//  SwiftUIView.swift
//  
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct ReportView: View {
    
    @Binding var isPresented: Bool
    
    @State private var senderEmail = ""
    @State private var messageContent = ""
    @State private var senderNumber = ""
    @State private var selectedSpamType = SpamType.other
    @State private var selectedFrequency = Frequency.other
    @State private var additionalDetails = ""
    
    let spamTypes = [SpamType.phishing, SpamType.scam, SpamType.advertisement, SpamType.other]
    let frequencies = [Frequency.daily, Frequency.weekly, Frequency.monthly, Frequency.other]
    
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
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "flag.circle")
                        .font(.system(size:60))
                    
                    Text("Report your spam messages")
                        .fontWeight(.bold)
                        .font(.system(size: 60))
                }
                
                VStack(alignment: .leading){
                    Text("Fill up the details for your report below.")
                        .font(.system(size: 40))
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Sender Email", text: $senderEmail)
                        .padding()
                        .font(.system(size: 30))

                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Sender Email", text: $senderNumber)
                        .padding()
                        .font(.system(size: 30))

                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Message", text: $messageContent)
                        .padding()
                        .font(.system(size: 30))

                }
                
                HStack{
                    
                    HStack{
                        Text("Spam Type")
                            .font(.system(size: 25))

                        Picker("Spam Type", selection: $selectedSpamType) {
                            ForEach(spamTypes, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Text("Frequency")
                            .font(.system(size: 25))
                        
                        Picker("Frequency", selection: $selectedFrequency) {
                            ForEach(frequencies, id: \.self) { frequency in
                                Text(frequency.rawValue).tag(frequency)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Additional Details", text: $additionalDetails)
                        .padding()
                        .font(.system(size: 30))

                }
            }
        }
        .padding(50)
    }
}



enum SpamType: String, CaseIterable {
    case phishing = "Phishing"
    case scam = "Scam"
    case advertisement = "Advertisement"
    case other = "Other"
}

enum Frequency: String, CaseIterable {
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case other = "Other"
}

#Preview {
    ReportView(isPresented: .constant(false))
}

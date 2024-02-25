//
//  SwiftUIView.swift
//  
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct ReportView: View {
    
    @Binding var isPresented: Bool
    @Binding var isSubmissionPresented: Bool
    
    @State private var isSheetPresented = false
    
    @State private var senderEmail = ""
    @State private var messageContent = ""
    @State private var senderNumber = ""
    @State private var selectedSpamType = SpamType.other
    @State private var selectedFrequency = Frequency.other
    @State private var additionalDetails = ""
    
    let spamTypes = [SpamType.phishing, SpamType.scam, SpamType.advertisement, SpamType.other]
    let frequencies = [Frequency.hourly, Frequency.daily, Frequency.weekly, Frequency.monthly, Frequency.other]
    
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
                        .font(.system(size: 25))

                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Sender Phone Number", text: $senderNumber)
                        .padding()
                        .font(.system(size: 25))

                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Message", text: $messageContent)
                        .padding()
                        .font(.system(size: 25))

                }
                
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.thinMaterial)
                        
                        VStack{
                            Text("Spam Type")
                                .font(.system(size: 25))
                                .padding()

                            Picker("Spam Type", selection: $selectedSpamType) {
                                ForEach(spamTypes, id: \.self) { type in
                                    Text(type.rawValue).tag(type)
                                }
                            }
                            .pickerStyle(.wheel)
                        }
                    }
                    .padding(.horizontal)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.thinMaterial)
                        
                        VStack{
                            Text("Frequency")
                                .font(.system(size: 25))
                                .padding()
                            
                            Picker("Frequency", selection: $selectedFrequency) {
                                ForEach(frequencies, id: \.self) { frequency in
                                    Text(frequency.rawValue).tag(frequency)
                                }
                            }
                            .pickerStyle(.wheel)
                        }
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Additional Details", text: $additionalDetails)
                        .padding()
                        .font(.system(size: 25))
                        .lineLimit(nil)
                        .frame(minHeight: 100)
                }
                
                Button {
                    isSheetPresented = true
                } label: {
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThickMaterial)
                            .frame(width: 300)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 0.5)
                            .frame(width: 300)
                        
                        Text("Submit")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .padding(10)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)

            } // v stack ends here
            .sheet(isPresented: $isSheetPresented) {
                SubmittedView(isSubmittedPresented: $isSheetPresented)
            }
        } // scroll view ends here
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
    case hourly = "Hourly"
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case other = "Other"
}

#Preview {
    ReportView(isPresented: .constant(false), isSubmissionPresented: .constant(false))
}

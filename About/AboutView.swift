//
//  SwiftUIView.swift
//  
//
//  Created by Ma Zhiyu on 25/2/24.
//

import SwiftUI

struct AboutView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ScrollView {
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
                .padding(.leading, 50)
                Spacer()
                
            }
            .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "info.circle")
                        .font(.system(size:60))
                    
                    Text("About Spam")
                        .fontWeight(.bold)
                        .font(.system(size: 60))
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("Introduction to Spam:")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            
                        Text("Spam, also known as junk email, refers to unsolicited or unwanted messages sent in bulk through electronic communication channels. These messages often contain advertisements, scams, or malicious content and can be transmitted through email, instant messaging, social media, or other online platforms.")
                            .font(.system(size: 30))
                    }
                    .multilineTextAlignment(.leading)
                    Image("spamjpg 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                }

                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    VStack(alignment: .leading, spacing: 10){
                        HStack {
                            Image(systemName: "text.bubble")
                                .font(.system(size:40))
                            
                            Text("Types of Spam:")
                                .font(.system(size: 40))
                            .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Text("Spam can manifest in various forms, including:")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Advertising spam: Unsolicited promotional messages aimed at promoting products or services.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Phishing emails: Deceptive emails designed to trick individuals into divulging sensitive information such as passwords, credit card numbers, or personal details.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Malware spam: Emails containing malicious attachments or links that, when clicked, can infect a user's device with malware, ransomware, or viruses.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Scam emails: Fraudulent messages that aim to deceive recipients by promising financial gains, job opportunities, or prizes, often requiring upfront payments or personal information.")
                            .font(.system(size: 30))
                    
                        Spacer()
                        
                        Text("• Chain letters: Messages that encourage recipients to forward the email to others with the promise of good luck, fortune, or dire consequences if not followed.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                    }
                    .multilineTextAlignment(.leading)
                    .padding()

                    
                }
                .padding(.top, 30)
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)
                    
                    VStack(alignment: .leading, spacing: 10){
                        HStack {
                            
                            Image(systemName: "exclamationmark.triangle")
                                .font(.system(size:40))
                            
                            Text("Why Spam is Dangerous:")
                                .font(.system(size: 40))
                            .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Text("Spam poses significant risks and challenges, including:")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Security threats: Spam emails may contain malicious attachments or links that can compromise the security of devices and networks, leading to data breaches, identity theft, or financial losses.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Privacy concerns: Spam often collects personal information through phishing scams or data harvesting techniques, jeopardizing individuals' privacy and exposing them to identity theft or online fraud.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Resource depletion: Dealing with spam consumes valuable resources, including time, storage space, and network bandwidth, reducing productivity and efficiency.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Reputation damage: Organizations that send spam risk tarnishing their brand reputation and credibility, leading to loss of customer trust and potential legal consequences.")
                            .font(.system(size: 30))
                        
                        Spacer()
                
                    }
                    .multilineTextAlignment(.leading)
                    .padding()
                }
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)
                    
                    VStack(alignment: .leading, spacing: 10){
                        HStack {
                            
                            Image(systemName: "checkmark.seal")
                                .font(.system(size:40))
                            
                            Text("How to protect yourself against falling for spam messages:")
                                .font(.system(size: 40))
                            .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Text("• Be cautious with sharing personal information: Avoid providing personal or sensitive information in response to unsolicited messages, especially those requesting financial details or login credentials.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Enable spam filters: Use spam filters provided by email service providers to automatically detect and filter out suspicious or unwanted messages.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Don't click on suspicious links: Refrain from clicking on links or downloading attachments from unknown or suspicious sources, as they may lead to malware infections or phishing scams.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Verify sender identities: Verify the authenticity of the sender before responding to or engaging with the message. Be wary of email addresses or phone numbers that seem unusual or unfamiliar.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("• Report and block spam: Report spam messages to your email service provider or relevant authorities and consider blocking senders to prevent further communication.")
                            .font(.system(size: 30))
                        
                        Spacer()
                
                    }
                    .multilineTextAlignment(.leading)
                    .padding()
                }

            }
            .padding(50)
        }
        .navigationBarTitle("About Spam")
    
    }
}

#Preview {
    AboutView(isPresented: .constant(false))
}

//
//  MLView.swift
//  WWDC24App
//
//  Created by Ma Zhiyu on 21/2/24.
//

import SwiftUI
import NaturalLanguage

struct MLView: View {
    // Instantiate your CoreML model
    let spamIdentifier = Spam_Identifier_1()

    // State variable to hold the text input
    @State private var userInput: String = ""
    
    // State variable to hold the prediction result
    @State private var predictionResult: String = ""
    
    // state variable for sentiment analysis
    @State private var sentimentScore: Double?

    @Binding var isPresented:Bool
    
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
                    Image(systemName: "checkmark.circle")
                        .font(.system(size:60))
                    
                    Text("Verify your messages")
                        .fontWeight(.bold)
                        .font(.system(size: 60))
                }
                
                VStack(alignment: .leading){
                    Text("Paste your messages below and click 'Predict Spam' to verify if they are spam content or not.")
                        .font(.system(size: 40))
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)

                    TextField("Enter text here", text: $userInput)
                        .padding()
                        .font(.system(size: 30))
                    
                    Spacer()
                    Spacer()
                }
                
                Button {
                    do {
                        // Make prediction using the model
                        let input = Spam_Identifier_1Input(text: userInput)
                        let output = try spamIdentifier.prediction(input: input)
                        
                        // Update prediction result
                        predictionResult = output.label
                        
                        // sentiment score
                        self.sentimentScore = detectSentiment(message: self.userInput)
                        
                    } catch {
                        
                        // Handle error
                        print("Error: \(error)")
                    }
                } label: {
                    ZStack(alignment: .center){
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThickMaterial)
                            .frame(width: 300)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 0.5)
                            .frame(width: 300)
                        
                        Text("Predict")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .padding(10)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "doc.plaintext")
                                .font(.system(size:40))
                            
                            Text("Prediction")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                        }
                        
                        HStack{
                            Text("Ham/Spam:")
                                .font(.system(size: 30))
                            
                            // Display ham/spam
                            Text("\(predictionResult)")
                                .font(.system(size: 30))
                        }
                                            
                        HStack{
                            Text("Sentiment Analysis:")
                                .font(.system(size:30))
                            
                            // Display sentiment score
                             if let score = sentimentScore {
                                 Text("\(score)")
                                     .font(.system(size: 30))
                             }
                        }
                    }
                    .padding()
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "info.circle")
                                .font(.system(size:40))
                            
                            Text("What your results mean")
                                .font(.system(size: 40))
                            .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Text("Ham/Spam: If the prediction is labeled as 'ham', your content is likely legitimate or non-spam. However, if your content is labeled as 'spam', it is likely that the analysed content is unsolicited and potentially malicious." )
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("Sentiment Analysis: Your sentiment value, ranging from -1 to +1, is a marker to show the emotional tone conveyed through your user input." )
                            .font(.system(size: 30))
                        
                        Text("The closer your score is to +1, the higher positive sentiment conveyed. A sentiment score closer to -1 indicates negative sentiment, suggesting dissatisfaction, sadness or anger. A score close to zero indicates neutral sentiment, which means a lack of emotional connectations." )
                            .font(.system(size: 20))
                    }
                    .padding()
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thickMaterial)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "info.circle")
                                .font(.system(size:40))
                            
                            Text("Information behind the model")
                                .font(.system(size: 40))
                            .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Text("This spam detector model is trained using an open-source SMS Spam Collection Dataset that contains 5574 SMS tagged messages collected for SMS Spam Research.")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("Warning: Results are only meant to serve as a marker to verify the spam content and sentiment index of your text input. Please do exercise your own judgement carefully.")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                    }
                    .padding()
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
        }
        .padding(50)
    }
}


struct MLView_Previews: PreviewProvider {
    static var previews: some View {
        MLView(isPresented: .constant(false))
    }
}

private func detectSentiment(message: String) -> Double? {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    tagger.string = message
    
    let (sentiment, _) = tagger.tag(at: message.startIndex, unit: .paragraph, scheme: .sentimentScore)
    
    // Check if sentiment score is available
    guard let sentimentScore = sentiment?.rawValue else {
        return nil
    }
    
    // Convert sentiment score string to double
    if let score = Double(sentimentScore) {
        return score
    } else {
        return nil
    }
}


//                Button("Predict") {
//                    do {
//                        // Make prediction using the model
//                        let input = Spam_Identifier_1Input(text: userInput)
//                        let output = try spamIdentifier.prediction(input: input)
//
//                        // Update prediction result
//                        predictionResult = output.label
//                    } catch {
//
//                        // Handle error
//                        print("Error: \(error)")
//                    }
//                }
//                .padding()

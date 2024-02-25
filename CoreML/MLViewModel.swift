//
//  File.swift
//  
//
//  Created by Ma Zhiyu on 23/2/24.
//


import CoreML


/// Model Prediction Input Type
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class Spam_Identifier_1Input : MLFeatureProvider {

    /// Input text as string value
    var text: String

    var featureNames: Set<String> {
        get {
            return ["text"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "text") {
            return MLFeatureValue(string: text)
        }
        return nil
    }
    
    init(text: String) {
        self.text = text
    }

}


/// Model Prediction Output Type
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class Spam_Identifier_1Output : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// Text label as string value
    var label: String {
        return self.provider.featureValue(for: "label")!.stringValue
    }

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(label: String) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["label" : MLFeatureValue(string: label)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class Spam_Identifier_1 {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "Spam Identifier 1", withExtension:"mlmodelc")!
    }

    /**
        Construct Spam_Identifier_1 instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of Spam_Identifier_1.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `Spam_Identifier_1.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct Spam_Identifier_1 instance by automatically loading the model from the app's bundle.
    */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct Spam_Identifier_1 instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct Spam_Identifier_1 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<Spam_Identifier_1, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct Spam_Identifier_1 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> Spam_Identifier_1 {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct Spam_Identifier_1 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<Spam_Identifier_1, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(Spam_Identifier_1(model: model)))
            }
        }
    }

    /**
        Construct Spam_Identifier_1 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> Spam_Identifier_1 {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return Spam_Identifier_1(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as Spam_Identifier_1Input

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as Spam_Identifier_1Output
    */
    func prediction(input: Spam_Identifier_1Input) throws -> Spam_Identifier_1Output {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as Spam_Identifier_1Input
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as Spam_Identifier_1Output
    */
    func prediction(input: Spam_Identifier_1Input, options: MLPredictionOptions) throws -> Spam_Identifier_1Output {
        let outFeatures = try model.prediction(from: input, options:options)
        return Spam_Identifier_1Output(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        - parameters:
           - input: the input to the prediction as Spam_Identifier_1Input
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as Spam_Identifier_1Output
    */
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    func prediction(input: Spam_Identifier_1Input, options: MLPredictionOptions = MLPredictionOptions()) async throws -> Spam_Identifier_1Output {
        let outFeatures = try await model.prediction(from: input, options:options)
        return Spam_Identifier_1Output(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - text: Input text as string value

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as Spam_Identifier_1Output
    */
    func prediction(text: String) throws -> Spam_Identifier_1Output {
        let input_ = Spam_Identifier_1Input(text: text)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [Spam_Identifier_1Input]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [Spam_Identifier_1Output]
    */
    func predictions(inputs: [Spam_Identifier_1Input], options: MLPredictionOptions = MLPredictionOptions()) throws -> [Spam_Identifier_1Output] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [Spam_Identifier_1Output] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  Spam_Identifier_1Output(features: outProvider)
            results.append(result)
        }
        return results
    }
}

//class MLViewModel: ObservableObject {
//
//    @Published var message: String = ""
//    @Published var spamStatus: String = ""
//    @Published var sentimentScore: String = ""
//
//    func detectSpam() {
//        do {
//            let spamDetector = try NLModel(mlModel: SPAMIdentifier1().model)
//            //let modelURL = Bundle.main.url(forResource: "Spam", withExtension: "mlmodel")
//            guard let prediction = spamDetector.predictedLabel(for: message) else {
//                print("Failed to predict result")
//                return
//            }
//
//            spamStatus = "spam status: \(prediction == "spam" ? "SPAM" : "NOT SPAM")"
//        } catch {
//            fatalError("Failed to load Natural Language Model: \(error)")
//        }
//    }
//
//    // range -1.0 (negative) to 1.0 (positive)
//    func detectSentiment() {
//        let tagger = NLTagger(tagSchemes: [.sentimentScore])
//        tagger.string = message
//
//        let (sentiment, _) = tagger.tag(at: message.startIndex, unit: .paragraph, scheme: .sentimentScore)
//
//        // it supports 7 languages: English, French, Italian, German, Spanish, Portuguese, and simplified Chinese.
//        guard let sentimentScore = sentiment?.rawValue else {
//            return
//        }
//
//        self.sentimentScore = "sentiment score: \(sentimentScore)"
//    }
//}

//
// Spam_Identifier_1.swift
//
// This file was automatically generated and should not be edited.
//

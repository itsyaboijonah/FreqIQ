//
//  Trivia.swift
//  FrequencyQuiz
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import Foundation

struct Trivia: Decodable{
    var results: [Result]
    
    struct Result: Decodable, Identifiable{
        var id: UUID {
            UUID()
        }
        var audioFilename: String
        var difficulty: String
        var correctFrequency: String
        var incorrectFrequencies: [String]
        var answers: [Answer]{
            return ([Answer(text: correctFrequency, isCorrect: true)] + incorrectFrequencies.map{x in Answer(text: x, isCorrect: false)}).shuffled()
        }
    }
}

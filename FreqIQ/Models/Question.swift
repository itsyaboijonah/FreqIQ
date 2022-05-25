//
//  Trivia.swift
//  FrequencyQuiz
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import Foundation

struct Question: Decodable{
    var examples: [Example]
    
    struct Example: Decodable, Identifiable{
        var id: UUID {
            UUID()
        }
        var audioFilename: String
        var difficulty: String
        var correctFrequency: String
        var incorrectFrequencies: [String]
        
    }
}

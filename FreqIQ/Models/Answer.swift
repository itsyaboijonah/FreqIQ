//
//  Answer.swift
//  FrequencyQuiz
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: String
    var isCorrect: Bool
}

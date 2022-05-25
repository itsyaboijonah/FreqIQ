//
//  Answer.swift
//  FrequencyQuiz
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}

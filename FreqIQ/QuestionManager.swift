//
//  QuestionManager.swift
//  FreqIQ
//
//  Created by Jonah Nimijean on 2022-05-25.
//

import Foundation
import SwiftUI

class QuestionManager: ObservableObject{
    private(set) var question: [Question.Example] = []
    @Published private(set) var length =  0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    
    func goToNextQuestion(){
        if index + 1 < length {
            index += 1
        } else{
            reachedEnd = true
        }
    }
    
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double(index+1) / Double(length) * 350)
        
//        if index < length{
//            let currentQuestion = question[index]
//            answerChoices = currentQuestion.
//        }
    }
}

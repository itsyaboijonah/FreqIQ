//
//  QuestionManager.swift
//  FreqIQ
//
//  Created by Jonah Nimijean on 2022-05-25.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject{
    private var normalSounds: Set = ["original","31.5Hz","63Hz","125Hz","250Hz","500Hz","1kHz","2kHz","4kHz","8kHz","16kHz"]
    private var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    @Published private(set) var filename = ""
    
    init(){
        generateQuestions()
        length = trivia.count
        setQuestion()
        index = 0
        score = 0
        progress = 0.00
        reachedEnd = false
    }
    
    func generateQuestions(){
        trivia = normalSounds.map{x in
            Trivia.Result(audioFilename: x+"12dB", difficulty: "Normal", correctFrequency: x, incorrectFrequencies: {
                var incorrectAnswers: Set = Set<String>()
                var alreadyUsed: Set = [x]
                repeat {
                    let current = normalSounds.subtracting(alreadyUsed).randomElement()!
                    incorrectAnswers.insert(current)
                    alreadyUsed.insert(current)
                } while incorrectAnswers.count < 3
                print(Array(incorrectAnswers).joined(separator: "-"))
                return Array(incorrectAnswers)
            }()
            )
        }
    }
    
    func goToNextQuestion(){
        if index + 1 < length {
            index += 1
            setQuestion()
        } else{ 
            reachedEnd = true
        }
    }
    
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double(index+1) / Double(length) * 350)
         
        if index < length{
            let currentTriviaQuestion = trivia[index]
            answerChoices = currentTriviaQuestion.answers
            filename = currentTriviaQuestion.audioFilename
        }
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect{
             score += 1 
        }
    }
}

//
//  TriviaView.swift
//  FrequencyQuiz
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        if triviaManager.reachedEnd{
            VStack(spacing: 20){
                 Text("FreqIQ")
                    .yellowTitle()
                
                Text("Congrats, you've completed the training 🥳")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                
                NavigationLink{
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Play Again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("black"))
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}

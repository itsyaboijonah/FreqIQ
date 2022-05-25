//
//  ContentView.swift
//  FrequencyQuiz
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40){
                VStack(spacing: 20){
                    Text("FreqIQ")
                        .yellowTitle()
                    Text("Train your ears to hear specific frequencies")
                        .foregroundColor(Color("AccentColor"))
                    
                    NavigationLink{
                        TriviaView()
                    } label: {
                        PrimaryButton(text: "Let's Go")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color("black"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

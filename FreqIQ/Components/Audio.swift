//
//  Audio.swift
//  FreqIQ
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import SwiftUI
import AVFoundation

struct Audio: View {
    
    @State var audioPlayer: AVAudioPlayer!
    var questionNumber: Int
    var sampleName: String
    
    var body: some View {
        ZStack {
                  VStack {
                      Text("Sample " + String(questionNumber)).font(.system(size: 45)).font(.largeTitle)
                      HStack {
                          Spacer()
                          Button(action: {
                              self.audioPlayer.play()
                          }) {
                              Image(systemName: "play.circle.fill").resizable()
                                  .frame(width: 50, height: 50)
                                  .aspectRatio(contentMode: .fit)
                          }
                          Spacer()
                          Button(action: {
                              self.audioPlayer.pause()
                          }) {
                              Image(systemName: "pause.circle.fill").resizable()
                                  .frame(width: 50, height: 50)
                                  .aspectRatio(contentMode: .fit)
                          }
                          Spacer()
                      }
                  }
              }
              .onAppear {
                  let sound = Bundle.main.path(forResource: sampleName, ofType: "wav")
                  self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
              }
    }
}

struct Audio_Previews: PreviewProvider {
    static var previews: some View {
        Audio(questionNumber: 1, sampleName: "original")
    }
}

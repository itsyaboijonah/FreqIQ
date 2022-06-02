//
//  Audio.swift
//  FreqIQ
//
//  Created by Jonah Nimijean on 2022-05-24.
//

import SwiftUI
import AVFoundation

struct Audio: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        ZStack {
                  VStack {
                      Text("Sample " + String(triviaManager.index+1)).font(.system(size: 45)).font(.largeTitle)
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
                let sound = Bundle.main.path(forResource: triviaManager.filename, ofType: "wav")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            }
            .onChange(of: triviaManager.filename){newFileName in
                    if (self.audioPlayer.isPlaying){
                        self.audioPlayer.stop()
                    }
                      let sound = Bundle.main.path(forResource: newFileName, ofType: "wav")
                      self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                  }
    }
}

struct Audio_Previews: PreviewProvider {
    static var previews: some View {
        Audio()
            .environmentObject(TriviaManager()) 
    }
}

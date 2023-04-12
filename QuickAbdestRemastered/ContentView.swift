import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var showFeels = false
    @State private var showText = false
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                VStack {
                    if showFeels {
                        Image("feels")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } else {
                        Image("feelsbad")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    
                    if showText {
                        Text("A B D E S T L E N D I N")
                            .font(.custom("Gill Sans Bold", size: 23))
                            .foregroundColor(Color.red)
                    }
                }
                .onTapGesture {
                    if !showFeels {
                        showFeels.toggle()
                        showText.toggle()
                        
                        if let audioFile = Bundle.main.path(forResource: "soundeffect", ofType: "mp3") {
                            let audioURL = URL(fileURLWithPath: audioFile)
                            audioPlayer = try? AVAudioPlayer(contentsOf: audioURL)
                            audioPlayer?.play()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                                showFeels.toggle()
                                showText.toggle()
                            }
                        }
                    }
                }
                
                Spacer()
            }
            
            if showFeels {
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(Color.gray)
                            .padding(.trailing)
                            .font(.system(size: 32))
                        
                    }
                    
                    Spacer()
                }
                .onTapGesture {
                    showFeels = false
                    showText = false
                    audioPlayer?.stop()
                }
            }
        }
    }
}

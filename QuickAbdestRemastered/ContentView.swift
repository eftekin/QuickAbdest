import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var showImageOne = true
    @State private var showLabel = false
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image(showImageOne ? "feelsbad" : "feels")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        if showImageOne {
                            showImageOne.toggle()
                            showLabel = true
                            playSound()
                        }
                    }
                if showLabel {
                    Text("A B D E S T L E N D I N")
                        .font(.custom("GillSans-Bold", size: 23))
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            audioPlayer?.stop()
        }
    }
    
    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "sound", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
                DispatchQueue.main.asyncAfter(deadline: .now() + (audioPlayer?.duration ?? 20)) {
                    showImageOne = true
                    showLabel = false
                }
            } catch {
                print("Error loading audio file")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

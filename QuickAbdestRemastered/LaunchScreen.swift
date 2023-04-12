import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("q u i c k  a b d e s t")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.indigo)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

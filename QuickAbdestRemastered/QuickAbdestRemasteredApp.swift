import SwiftUI

@main
struct QuickAbdestRemasteredApp: App {
    @State private var showLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                if showLaunchScreen {
                    LaunchScreen()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        showLaunchScreen = false
                    }
                }
            }
        }
    }
}

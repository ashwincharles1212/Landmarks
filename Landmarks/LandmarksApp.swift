import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var sharedData = SharedData() // Create a single source of truth

    var body: some Scene {
        WindowGroup {
            MainView() // Use MainView as the root view
                .environmentObject(sharedData) // Pass SharedData to all views
        }
    }
}

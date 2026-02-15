import SwiftUI

@main
struct MonAppClipApp: App {
    @UIApplicationDelegateAdaptor(AppDelegateClip.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            EmptyView() // SwiftUI est désactivé ici, storyboard sera chargé via AppDelegate
        }
    }
}

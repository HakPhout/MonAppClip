import UIKit

class AppDelegateClip: NSObject, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = storyboard.instantiateInitialViewController()

        window.rootViewController = initialVC
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}

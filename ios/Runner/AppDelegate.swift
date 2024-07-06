import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    

    var flutterViewController: FlutterViewController!
//    var window: UIWindow?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GMSServices.provideAPIKey("Input API_KEY")
    GeneratedPluginRegistrant.register(with: self)
    configureGlobalAppearance()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func configureGlobalAppearance() {
      // Initialize Flutter view controller
      flutterViewController = FlutterViewController()
      // Set LaunchViewController as root view controller
      let launchViewController = SplashScreenViewController()
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = launchViewController
      window?.makeKeyAndVisible()

    }
    
    func showFlutterView() {
      window?.rootViewController = flutterViewController
    }
}

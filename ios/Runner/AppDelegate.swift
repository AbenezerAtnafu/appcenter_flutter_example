import UIKit
import Flutter
import GoogleMaps  // Add this import

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

        GMSServices.provideAPIKey("AIzaSyCWylEB0BOElNoeQ-5o1TKfYGBJY2qrs_M")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

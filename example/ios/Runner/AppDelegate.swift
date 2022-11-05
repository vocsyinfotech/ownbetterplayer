import UIKit
import Flutter
import MediaPlayer

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      
      
      
      PluginExample.register(with: registrar(forPlugin: "PluginExample"))
      
      
      
      
      
  let commandCenter = MPRemoteCommandCenter.shared()

      commandCenter.previousTrackCommand.addTarget { [unowned self] event in
          print("previousTrackCommand")
          UserDefaults.standard.set("STOP", forKey: "Key")
                   UserDefaults.standard.set("previous", forKey: "Key2")

                          UserDefaults.standard.synchronize()
                  return .success
              }
      
      commandCenter.nextTrackCommand.addTarget { [unowned self] event in
          print("nextTrackCommand")
          UserDefaults.standard.set("STOP", forKey: "Key")
                   UserDefaults.standard.set("next", forKey: "Key2")

                          UserDefaults.standard.synchronize()
                  return .success
              }
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

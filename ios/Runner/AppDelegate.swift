import UIKit
import Reachability
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private var reachability = try! Reachability()
    private let networkEventChannel = "platform_channel_events/connectivity"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller = window?.rootViewController as! FlutterViewController
      
   
    // Method channel
      let methodChannel = FlutterMethodChannel(name: "BATTERY_INFO", binaryMessenger: controller.binaryMessenger)
      
      
      // Eventchannel
               FlutterEventChannel(name: networkEventChannel, binaryMessenger: controller.binaryMessenger)
                           .setStreamHandler(NetworkStreamHandler(reachability: reachability))
         
      methodChannel.setMethodCallHandler({
          (call:FlutterMethodCall, result : @escaping FlutterResult) -> Void in
          switch call.method {
          case "batterymethod":
              result(self.receiveBatteryLevel())
              
          default:
              result(FlutterMethodNotImplemented)
          }
      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func receiveBatteryLevel() -> Int {
        
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        
        if device.batteryState == UIDevice.BatteryState.unknown {
            return -1
        } else {
            return Int(device.batteryLevel * 100)
        }
        
    }
}

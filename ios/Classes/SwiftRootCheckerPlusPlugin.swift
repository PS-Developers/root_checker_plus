import Flutter
import UIKit
import DTTJailbreakDetection

public class SwiftRootCheckerPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "root_checker_plus", binaryMessenger: registrar.messenger())
    let instance = SwiftRootCheckerPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

   public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "isJailbreak":
            let isJailbreak = DTTJailbreakDetection.isJailbroken()
            result(isJailbreak)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
  }
}

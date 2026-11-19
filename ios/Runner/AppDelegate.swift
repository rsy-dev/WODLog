import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "WodLogAccessibility") {
      FlutterEventChannel(
        name: "wodlog/reduce_transparency",
        binaryMessenger: registrar.messenger()
      ).setStreamHandler(ReduceTransparencyStream())
    }
  }
}

private final class ReduceTransparencyStream: NSObject, FlutterStreamHandler {
  private var observation: NSObjectProtocol?

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    events(UIAccessibility.isReduceTransparencyEnabled)
    observation = NotificationCenter.default.addObserver(
      forName: UIAccessibility.reduceTransparencyStatusDidChangeNotification,
      object: nil,
      queue: .main
    ) { _ in
      events(UIAccessibility.isReduceTransparencyEnabled)
    }
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    if let observation {
      NotificationCenter.default.removeObserver(observation)
      self.observation = nil
    }
    return nil
  }
}

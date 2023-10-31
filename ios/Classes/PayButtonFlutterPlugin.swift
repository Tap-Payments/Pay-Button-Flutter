import Flutter
import UIKit
import Pay_Button_iOS

public class PayButtonFlutterPlugin: NSObject, FlutterPlugin , PayButtonDelegate,FlutterStreamHandler {
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
    
    var eventSink: FlutterEventSink?
    var result: FlutterResult?
    var button: PayButtonView = .init()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "pay_button_flutter", binaryMessenger: registrar.messenger())
    let instance = PayButtonFlutterPlugin()
      let factory = PayButtonViewFactory(messenger: registrar.messenger(),payButtonDelegate: instance, payButtonView: instance.button)
      registrar.register(factory, withId: "plugin/pay_button_view")
      let eventChannel = FlutterEventChannel(name: "pay_button_event", binaryMessenger: registrar.messenger())
      eventChannel.setStreamHandler(instance)
      registrar.addMethodCallDelegate(instance, channel: channel)

  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      self.result = result
            switch call.method {
            case "start":
                break
            case "start2":
                break
            default:
              result(FlutterMethodNotImplemented)
    }
  }
  
  public func onReady() {
           self.eventSink?(["onReady":"OnReady Callback Executed"])
       }
       
  public func onClicked() {
           self.eventSink?(["onClicked":"onClicked Callback Executed"])
       }
       
  public func onCanceled() {
           self.eventSink?(["onCanceled":"onCanceled Callback Executed"])
       }
       
  public func onSuccess(data: String) {
           self.eventSink?(["onSuccess":data])
       }
       
  public func onError(data: String) {
           self.eventSink?(["onError":data])

       }
       
  public func onOrderCreated(data: String) {
           
           self.eventSink?(["onOrderCreated":data])

       }
       
  public func onChargeCreated(data: String) {
           self.eventSink?(["onChargeCreated":data])
       }
}

 import Flutter
 import UIKit
 import Pay_Button_iOS

 class PayButtonViewFactory: NSObject, FlutterPlatformViewFactory {
     private var messenger: FlutterBinaryMessenger

     private var payButtonDelegate: PayButtonDelegate

     private var payButtonView: PayButtonView

     init(messenger: FlutterBinaryMessenger,payButtonDelegate:PayButtonDelegate, payButtonView: PayButtonView) {
         self.messenger = messenger
         self.payButtonDelegate = payButtonDelegate
         self.payButtonView = payButtonView
         super.init()
     }

     func create(
         withFrame frame: CGRect,
         viewIdentifier viewId: Int64,
         arguments args: Any?
     ) -> FlutterPlatformView {
         return PayButtonNativeView(
             frame: frame,
             viewIdentifier: viewId,
             arguments: args,
             binaryMessenger: messenger,
             payButtonDelegate: payButtonDelegate,
             payButtonView: payButtonView
         )
     }

     /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
     public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
           return FlutterStandardMessageCodec.sharedInstance()
     }
 }

 class PayButtonNativeView: NSObject, FlutterPlatformView {
     private var _view: UIView
     private var _args: [String:Any]?
     private var payButtonDelegate: PayButtonDelegate


     init(
         frame: CGRect,
         viewIdentifier viewId: Int64,
         arguments args: Any?,
         binaryMessenger messenger: FlutterBinaryMessenger?,
         payButtonDelegate: PayButtonDelegate,
         payButtonView: PayButtonView

     ) {
         self.payButtonDelegate = payButtonDelegate
         _view = UIView()
         self._args = args as? [String:Any]
         super.init()
         createNativeView(view: _view, payButtonView: payButtonView)
     }

     func view() -> UIView {
         return _view
     }

     func createNativeView(view _view: UIView,payButtonView: PayButtonView){
         _view.backgroundColor = UIColor.clear
         DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)){
             self._view.addSubview(payButtonView)
             self._view.bringSubviewToFront(payButtonView)
             payButtonView.translatesAutoresizingMaskIntoConstraints = false
                 NSLayoutConstraint.activate([
                    payButtonView.leadingAnchor.constraint(equalTo: self._view.leadingAnchor, constant: 0),
                    payButtonView.trailingAnchor.constraint(equalTo: self._view.trailingAnchor, constant: 0),
                    payButtonView.centerYAnchor.constraint(equalTo: self._view.centerYAnchor)
                 ])
             payButtonView.initPayButton(configDict: self._args?["configuration"] as? [String:Any] ?? [:],delegate: self.payButtonDelegate, payButtonType: PayButtonTypeEnum.init(rawValue: PayButtonTypeEnum.allCases.map{ $0.toString().lowercased() }.firstIndex(of: (self._args?["button_type"] as? String ?? "").lowercased()) ?? 0) ?? .BenefitPay)
             }
     }
 }

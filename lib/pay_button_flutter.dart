import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_button_flutter/enums/enums.dart';

class PayButtonFlutterWidget extends StatefulWidget {
  final Map<String, dynamic> configDict;
  final ButtonType payButtonType;
  final Function()? onReady, onClicked, onCanceled;
  final Function(String?)? onSuccess, onError, onOrderCreated, onChargeCreated;

  const PayButtonFlutterWidget({
    super.key,
    required this.configDict,
    required this.payButtonType,
    this.onReady,
    this.onClicked,
    this.onSuccess,
    this.onError,
    this.onCanceled,
    this.onChargeCreated,
    this.onOrderCreated,
  });

  @override
  State<PayButtonFlutterWidget> createState() => _PayButtonFlutterWidgetState();
}

class _PayButtonFlutterWidgetState extends State<PayButtonFlutterWidget> {
  late Function()? onReadyFunction;
  late Function()? onClickedFunction;
  late Function()? onCanceledFunction;
  late Function(String?)? onSuccessFunction;
  late Function(String?)? onErrorFunction;
  late Function(String?)? onChargeCreatedFunction;
  late Function(String?)? onOrderCreatedFunction;

  static const MethodChannel _channel = MethodChannel('pay_button_flutter');

  static const EventChannel _eventChannel = EventChannel('pay_button_event');

  void streamTimeFromNative() {
    _eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(dynamic event) {
    //Receive Event
    handleCallbacks(event);
  }

  void _onError(dynamic event) {}

  @override
  void initState() {
    debugPrint("Configuration >> ${widget.configDict}");
    Future.delayed(const Duration(seconds: 0), () {
      streamTimeFromNative();
      startTapCardSDK();
    });
    super.initState();
  }

  Future<dynamic> startTapCardSDK() async {
    try {
      dynamic result = await _channel.invokeMethod(
        'start',
        {
          "button_type": widget.configDict["button_type"],
          "configuration": widget.configDict["dictionaryHashMap"],
        },
      );
      handleCallbacks(result);
      _startTapCardSDK2();
      // return responseData;
    } catch (ex) {
      debugPrint("Start SDK Exception >>>>>> $ex");
    }
  }

  Future<dynamic> _startTapCardSDK2() async {
    try {
      dynamic result = await _channel.invokeMethod(
        'start2',
        {
          "button_type": widget.configDict["button_type"],
          "configuration": widget.configDict["dictionaryHashMap"],
        },
      );

      handleCallbacks(result);
      _startTapCardSDK2();
      //  return responseData;
    } catch (ex) {
      debugPrint("Exception >>>>>> $ex");
    }
  }

  handleCallbacks(dynamic result) {
    if (result.containsKey("onReady")) {
      debugPrint("On ready callback fired : ${result["onReady"]}");
      onReadyFunction = widget.onReady;
      onReadyFunction!();
    }

    if (result.containsKey("onClicked")) {
      debugPrint("On Click callback fired");
      onClickedFunction = widget.onClicked;
      onClickedFunction!();
    }

    if (result.containsKey("onSuccess")) {
      /// onSuccess Callbacks Triggered From SDK
      debugPrint("On Success callback fired");
      var resultOfSuccess = result["onSuccess"];
      onSuccessFunction = widget.onSuccess;
      onSuccessFunction!(resultOfSuccess.toString());
    }

    if (result.containsKey("onError")) {
      debugPrint(
          "OnError Callback Fired>>>>> ${jsonDecode(result["onError"])} ");
      var resultOfError = result["onError"];
      onErrorFunction = widget.onError;
      onErrorFunction!(resultOfError.toString());
    }

    if (result.containsKey("onOrderCreated")) {
      /// onValidInput Callbacks Triggered From SDK
      debugPrint("On Error Callback Fired>>>>>");
      var resultOfOnOrderCreated = result["onOrderCreated"];
      onOrderCreatedFunction = widget.onOrderCreated;
      onOrderCreatedFunction!(resultOfOnOrderCreated.toString());
    }

    if (result.containsKey("onChargeCreated")) {
      /// onValidInput Callbacks Triggered From SDK
      var resultOfOnChargeCreated = result["onChargeCreated"];
      onChargeCreatedFunction = widget.onChargeCreated;
      onChargeCreatedFunction!(resultOfOnChargeCreated.toString());
    }

    if (result.containsKey("onCanceled")) {
      /// onValidInput Callbacks Triggered From SDK
      debugPrint("On Cancel Callback Fired>>>>>");
      //  var resultOfOnOrderCreated = jsonDecode(result["onCancel"]);
      onCanceledFunction = widget.onCanceled;
      onCanceledFunction!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return SizedBox(
        height: 48,
        child: AndroidView(
          viewType: "plugin/pay_button_view",
          creationParams: {
            "button_type": widget.configDict["button_type"],
            "configuration": widget.configDict["dictionaryHashMap"],
          },
          creationParamsCodec: const StandardMessageCodec(),
          layoutDirection: TextDirection.ltr,
        ),
      );
    } else {
      return SizedBox(
        height: 48,
        child: UiKitView(
          viewType: "plugin/pay_button_view",
          creationParams: {
            "button_type": widget.configDict["button_type"],
            "configuration": widget.configDict["dictionaryHashMap"],
          },
          creationParamsCodec: const StandardMessageCodec(),
          layoutDirection: TextDirection.ltr,
        ),
      );
    }
  }
}

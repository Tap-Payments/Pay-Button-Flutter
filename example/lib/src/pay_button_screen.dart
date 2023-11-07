import 'package:flutter/material.dart';
import 'package:pay_button_flutter/enums/enums.dart';
import 'package:pay_button_flutter/pay_button_flutter.dart';

class PayButtonScreen extends StatefulWidget {
  final Map<String, dynamic> sdkConfiguration;
  final ButtonType buttonType;

  const PayButtonScreen({
    super.key,
    required this.sdkConfiguration,
    required this.buttonType,
  });

  @override
  State<PayButtonScreen> createState() => _PayButtonScreenState();
}

class _PayButtonScreenState extends State<PayButtonScreen> {
  String sdkResponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 50,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              sdkResponse.isEmpty ? " " : "SDK RESPONSE : ${sdkResponse ?? ""}",
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
        ),
        child: PayButtonFlutterWidget(
          configDict: widget.sdkConfiguration,
          payButtonType: widget.buttonType,
          onReady: () {
            debugPrint(">OnReady Callback Fired");
          },
          onClicked: () {
            debugPrint(">OnClicked Callback Fired");
          },
          onSuccess: (String? data) {
            debugPrint(">OnSuccess Callback Fired : $data");
            setState(() {
              sdkResponse = data ?? "";
            });
          },
          onError: (String? data) {
            debugPrint(">OnError Callback Fired : $data");
            setState(() {
              sdkResponse = data ?? "";
            });
          },
          onChargeCreated: (String? data) {
            debugPrint(">OnChargeCreated Callback Fired : $data");
            setState(() {
              sdkResponse = data ?? "";
            });
          },
          onOrderCreated: (String? data) {
            debugPrint(">onOrderCreated Callback Fired : $data");
            setState(() {
              sdkResponse = data ?? "";
            });
          },
          onCanceled: () {
            debugPrint(">onCanceled Callback Fired");
            setState(() {
              sdkResponse = "Cancelled";
            });
          },
        ),
      ),
    );
  }
}

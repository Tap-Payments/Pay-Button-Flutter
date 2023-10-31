import 'package:flutter/material.dart';
import 'package:pay_button_flutter/pay_button_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String sdkResponse = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 40,
          ),
          child: PayButtonFlutterWidget(
            sdkConfiguration: const {
              "operator": {
                "publicKey": "pk_test_6jdl4Qo0FYOSXmrZTR1U5EHp",
                // "pk_test_HJN863LmO15EtDgo9cqK7sjS",
                "hashString": ""
              },
              "order": {
                "id": "",
                "amount": 0.1,
                "currency": "BHD",
                "description": "description",
                "reference": "",
              },
              "customer": {
                "id": "",
                "name": [
                  {
                    "lang": "en",
                    "first": "TAP",
                    "middle": "",
                    "last": "PAYMENTS"
                  }
                ],
                "contact": {
                  "email": "tap@tap.company",
                  "phone": {"countryCode": "+965", "number": "88888888"},
                },
              },
            },
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

        // body: Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 18,
        //     vertical: 50,
        //   ),
        //   child: SingleChildScrollView(
        //     child: Center(
        //       child: Text(
        //         sdkResponse.isEmpty
        //             ? " "
        //             : "SDK RESPONSE : ${sdkResponse ?? ""}",
        //       ),
        //     ),
        //   ),
        // ),
        // bottomSheet: Padding(
        //   padding: const EdgeInsets.only(
        //     bottom: 40,
        //   ),
        //   child: PayButtonFlutterWidget(
        //     sdkConfiguration: const {
        //       "operator": {
        //         "publicKey": "pk_test_6jdl4Qo0FYOSXmrZTR1U5EHp", // "pk_test_HJN863LmO15EtDgo9cqK7sjS",
        //         "hashString": ""
        //       },
        //       "order": {
        //         "id": "",
        //         "amount": 0.1,
        //         "currency": "BHD",
        //         "description": "description",
        //         "reference": "",
        //       },
        //       "customer": {
        //         "id": "",
        //         "name": [
        //           {
        //             "lang": "en",
        //             "first": "TAP",
        //             "middle": "",
        //             "last": "PAYMENTS"
        //           }
        //         ],
        //         "contact": {
        //           "email": "tap@tap.company",
        //           "phone": {"countryCode": "+965", "number": "88888888"},
        //         },
        //       },
        //     },
        //     onReady: () {
        //       debugPrint(">OnReady Callback Fired");
        //     },
        //     onClicked: () {
        //       debugPrint(">OnClicked Callback Fired");
        //     },
        //     onSuccess: (String? data) {
        //       debugPrint(">OnSuccess Callback Fired : $data");
        //       setState(() {
        //         sdkResponse = data ?? "";
        //       });
        //     },
        //     onError: (String? data) {
        //       debugPrint(">OnError Callback Fired : $data");
        //       setState(() {
        //         sdkResponse = data ?? "";
        //       });
        //     },
        //     onChargeCreated: (String? data) {
        //       debugPrint(">OnChargeCreated Callback Fired : $data");
        //       setState(() {
        //         sdkResponse = data ?? "";
        //       });
        //     },
        //     onOrderCreated: (String? data) {
        //       debugPrint(">onOrderCreated Callback Fired : $data");
        //       setState(() {
        //         sdkResponse = data ?? "";
        //       });
        //     },
        //     onCanceled: () {
        //       debugPrint(">onCanceled Callback Fired");
        //       setState(() {
        //         sdkResponse = "Cancelled";
        //       });
        //     },
        //   ),
        // ),
      ),
    );
  }
}

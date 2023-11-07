




# Pay-Button-Flutter

Integrating Flutter Pay Button SDK in your application

# Introduction[](https://developers.tap.company/docs/pay-button-ios#introduction)

Before diving into the development process, it's essential to establish the prerequisites and criteria necessary for a successful build. In this step, we'll outline the specific Android/iOS requirements, including the minimum SDK version and other important details you need to consider. Let's ensure your project is set up for success from the very beginning.

# Sample Demo

![enter image description here](https://github.com/Tap-Payments/BenefitPay-iOS/blob/main/ezgif.com-optimize-3.gif?raw=true)



# Step 1: Requirements[](https://developers.tap.company/docs/pay-button-ios#step-1-requirements)

- We support from iOS 13.0+
- Dart 3.0.0+
- A minimum  [Android SDK/API level](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels) of 24+
# Step 2: Get Your Public Keys[](https://developers.tap.company/docs/pay-button-ios#step-2-get-your-public-keys)

While you can certainly use the sandbox keys available within our sample app which you can get by following the  [installation](https://developers.tap.company/docs/pay-button-ios#step-3-installation-using-gradle)  process, however, we highly recommend visiting our  [onboarding](https://register.tap.company/ae/en/sell)  page, there you'll have the opportunity to register your package name and acquire your essential Tap Key for activating Pay-Button-Flutter integration.

# Step 3: Installation[](https://developers.tap.company/docs/pay-button-ios#step-3-installation)


In the  `pubspec.yaml` of your flutter project, add the following dependency:

dependencies:

```
banefit_pay_flutter: 1.0.0
``` 

## CocoaPods
Run this in terminal :
 ```
 cd ios
 pod install
 pod update
 ```
# Step 4: Integrating Pay-Button-Flutter[](https://developers.tap.company/docs/pay-button-ios#step-4-pay-button-ios)

This integration offers two distinct options: a  [simple integration](https://developers.tap.company/docs/pay-button-ios#simple-integration)  designed for rapid development and streamlined merchant requirements, and an  [advanced integration](https://developers.tap.company/docs/pay-button-ios#advanced-integration)  that adds extra features for a more dynamic payment integration experience.



## Simple Integration[](https://developers.tap.company/docs/pay-button-ios#simple-integration)

Here, you'll discover a comprehensive table featuring the parameters applicable to the simple integration. Additionally, you'll explore the various methods for integrating the SDK, either using storyboard to create the layout and then implementing the controllers functionalities by code, or directly using code. Furthermore, you'll gain insights into how to receive the callback notifications.

### Parameters[](https://developers.tap.company/docs/pay-button-ios#parameters)
Each parameter is linked to the  [reference](https://developers.tap.company/docs/pay-button-ios#reference)  section, which provides a more in depth explanation of it.

|Parameter|Description | Required | Type| Sample
|--|--|--| --|--|
| operator| It has the key obtained after registering your package name, also known as Public key. Also, the [hashString](https://developers.tap.company/docs/pay-button-ios#generate-the-hash-string) value which is used to validate live charges. | True  | `Map<String, dynamic>`| `{"operator": {"publicKey":"pk_test_YhUjg9PNT8oDlKJ1aE2fMRz7", "hashString":""}` |
| order| Order details linked to the charfe. | True  | `Map<String, dynamic>`| `{ "order": {"id":"", "amount":1, "currency":"SAR", "description": " description","reference":"","metadata":{}}` |
| customer|Customer details for charge process. | True  | `Map<String, dynamic>`| `{ "customer"  {"id":"","name":[{"lang":"en","first":"TAP","middle":"","last":"PAYMENTS"}], "contact":{"email":"tap@tap.company", "phone":{"countryCode":"+965","number":"88888888"}}}` |


### Configuring the Pay-Button-Flutter SDK[](https://developers.tap.company/docs/pay-button-ios#configuring-the-pay-button-ios-sdk)

After creating the UI using any of the previously mentioned ways, it is time to pass the parameters needed for the SDK to work as expected and serve your need correctly.

1.  **Creating the parameters**  
    To allow flexibility and to ease the integration, your application will only has to pass the parameters as a  `Map<String, dynamic>` .  
    First, let us create the required parameters:

```dart
/// The minimum needed configuration dictionary
  Map<String. dynamic> configDict =  {
      "operator": {"publicKey": "pk_test_HJN863LmO15EtDgo9cqK7sjS", "hashString": ""},
      "order": {
        "id": "",
        "amount": 0.1,
        "currency": "BHD",
        "description": "description",
        "reference": ""
      },
      "customer": {
        "id": "",
        "name": [{"lang": "en", "first": "TAP", "middle": "", "last": "PAYMENTS"}],
        "contact": {
          "email": "tap@tap.company",
          "phone": {"countryCode": "+965", "number": "88888888"},
        },
      }
```

2. Pass these parameters to the create Button view as follows
```dart
// We provide the button view the needed parameters and we assign ourselves optionally to be the delegate, where we can listen to callbacks. Also, we have to pass which button type we want to display.
PayButtonFlutterWidget(configDict: configDict, payButtonType: ButtonType.BENEFITPAY)
```

**Full code snippet for creating the parameters + passing it PayButton variable**
```dart
import 'package:flutter/material.dart';  
import 'package:pay_button_flutter/enums/enums.dart';  
import 'package:pay_button_flutter/pay_button_flutter.dart';  
  
class PayButtonScreen extends StatefulWidget {   
  const PayButtonScreen({super.key  });  
  
  @override  
  State<PayButtonScreen> createState() => _PayButtonScreenState();  
}  
  
class _PayButtonScreenState extends State<PayButtonScreen> {  
  String sdkResponse = "";

  Map<String. dynamic> configDict =  {
      "operator": {"publicKey": "pk_test_HJN863LmO15EtDgo9cqK7sjS", "hashString": ""},
      "order": {
        "id": "",
        "amount": 0.1,
        "currency": "BHD",
        "description": "description",
        "reference": ""
      },
      "customer": {
        "id": "",
        "name": [{"lang": "en", "first": "TAP", "middle": "", "last": "PAYMENTS"}],
        "contact": {
          "email": "tap@tap.company",
          "phone": {"countryCode": "+965", "number": "88888888"},
        },
   }  
  
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
          configDict: configDict,  
          payButtonType: ButtonType.BENEFITPAY, 
        ),  
      ),  
    );  
  }  
}
```

**Full code snippet for creating the parameters + passing it PayButton variable + Listening to callbacks**

```dart

import 'package:flutter/material.dart';  
import 'package:pay_button_flutter/enums/enums.dart';  
import 'package:pay_button_flutter/pay_button_flutter.dart';  
  
class PayButtonScreen extends StatefulWidget { 
  const PayButtonScreen({  super.key  });  
  
  @override  
  State<PayButtonScreen> createState() => _PayButtonScreenState();  
}  
  
class _PayButtonScreenState extends State<PayButtonScreen> {  
  String sdkResponse = "";  
  Map<String. dynamic> configDict =  {
      "operator": {"publicKey": "pk_test_HJN863LmO15EtDgo9cqK7sjS", "hashString": ""},
      "order": {
        "id": "",
        "amount": 0.1,
        "currency": "BHD",
        "description": "description",
        "reference": ""
      },
      "customer": {
        "id": "",
        "name": [{"lang": "en", "first": "TAP", "middle": "", "last": "PAYMENTS"}],
        "contact": {
          "email": "tap@tap.company",
          "phone": {"countryCode": "+965", "number": "88888888"},
        },
   }
  
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
              configDict: configDictn,  
              payButtonType: ButtonType.BENEFITPAY,  
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

```


## Advanced Integration

[](https://developers.tap.company/docs/pay-button-ios#advanced-integration)

The advanced configuration for the PayButton-Flutter integration not only has all the features available in the simple integration but also introduces new capabilities, providing merchants with maximum flexibility. You can find a code below, where you'll discover comprehensive guidance on implementing the advanced flow as well as a complete description of each parameter.

### Parameters[](https://developers.tap.company/docs/pay-button-ios#parameters-1)
Each parameter is linked to the  [reference](https://developers.tap.company/docs/pay-button-ios#reference)  section, which provides a more in depth explanation of it.
|Configuration|Description | Required | Type| Sample
|--|--|--| --|--|
| operator|It has the key obtained after registering your package name, also known as Public key. Also, the [hashString](https://developers.tap.company/docs/pay-button-ios#generate-the-hash-string) value which is used to validate live charges. | True  | `Map<String, dynamic>`| `{"operator": {"publicKey":"pk_test_YhUjg9PNT8oDlKJ1aE2fMRz7", "hashString":""}` |
| scope| Intention of the pay button (optional.) | False  | `String`| `"scope":"charge"` |
| transaction| Transaction details linked to the charge. | True  | `Map<String, dynamic>`| `{"transaction":{"authentication":true,"authorize":{"type":"VOID","time":12},"paymentAgreement": {"id": "","contract": {"id": ""}}, "reference":"trx", "metadata":{}}` |
| order| Order details linked to the charge. | True  | `Map<String, dynamic>`| `{ "order":{"id":"", "amount":1, "currency":"SAR", "description": " description","reference":"","metadata":{}}` |
| invoice| Invoice id to link to the order (optional). | False  | `Map<String, dynamic>`| `{"invoice":{"id":""}` |
| merchant| Merchant id obtained after registering your bundle id. | True  | `Map<String, dynamic>`| `{"merchant":{"id":""}` |
| customer|Customer details for charge process. | True  | `Map<String, dynamic>`| ` {"customer":{"id":"", "name":[{"lang":"en","first":"TAP","middle":"","last":"PAYMENTS"}], "contact":{"email":"tap@tap.company", "phone":{"countryCode":"+965","number":"88888888"}}}` |
| interface| Look and feel related configurations (optional). | False  | `Map<String, dynamic>`| `{"interface":{"locale": "en", "theme": "light", "edges": "curved", "colorStyle": "colored", "loader": true}` |
| post| Webhook for server-to-server updates (optional). | False  | `Map<String, dynamic>`| `{post:{"url":""}` |

###  Initialisation of the input[](https://developers.tap.company/docs/pay-button-ios#initialisation-of-the-input)

You can use a Dictionary  to send data to our SDK. The benefit is that you can generate this data from one of your APIs. If we make updates to the configurations, you can update your API, avoiding the need to update your app on the  App Store.

```dart
  /// The   configuration dictionary
  { "parameters":   {
      "operator": {"publicKey": "pk_test_6jdl4Qo0FYOSXmrZTR1U5EHp", "hashString": ""},
      "scope": "charge",
      "transaction": {
        "authentication": true,
        "authorize": {
          "type": "VOID",
          "time": 12,
        },
        "paymentAgreement": {
          "id": "",
          "contract": {"id": ""},
        },
        "reference": "trx",
        "metadata": {},
      },
      "order": {
        "id": "",
        "amount": 0.1,
        "currency": "KWD",
        "description": "Authentication description",
        "reference": "ordRef",
        "metadata": {},
      },
      "invoice": {"id": ""},
      "merchant": {"id": ""},
      "customer": {
        "id": "",
        "name": [{"lang": "en", "first": "TAP", "middle": "", "last": "PAYMENTS"}],
        "contact": {
          "email": "tap@tap.company",
          "phone": {"countryCode": "+965", "number": "88888888"},
        },
      },
      "interface": {
        "locale": "en",
        "theme": "light",
        "edges": "curved",
        "colorStyle": "colored",
        "loader": true,
      },
      "post": {"url": ""},
    }
```


###  Receiving Callback Notifications (Advanced Version)[](https://developers.tap.company/docs/pay-button-ios#receiving-callback-notifications-advanced-version)

The below will allow the integrators to get notified from events fired from the PayButton.

```dart
  ///  Will be fired whenever there is an error related to the button connectivity or apis
  ///  - Parameter  data: includes a JSON format for the error description and error
  onError(String? data) {
	print("\n\n========\n\nonError \$data)");
  }
	///  Will be fired whenever the charge is completed, regardless of its status.
	///  - Parameter  data: includes a JSON format for the charge details
  onSuccess(String? dat) {
	print("\n\n========\n\nonError \$data)");
  }

	///  Will be fired whenever the order is created. use it, if you want to retrieve its data from your backend for state manegement purposes
	///  - Parameter  data: Order id.
   onOrderCreated(String? dat) {
	print("\n\n========\n\nonError \$data)");
  }
	///  Will be fired whenever the charge is created. use it, if you want to retrieve its data from your backend for state manegement purposes
	///  - Parameter  data: json data representing the charge model.

   onChargeCreated(String? dat) {
	print("\n\n========\n\nonError \$data)");
  }
  ///  Will be fired whenever the pay button is rendered and loaded
   onReady() {
    print("\n\n========\n\nonReady");
  }
  ///  Will be fired whenever the customer clicked on the benefit pay button. Now the button will be in loading state to render the pay popup
   onClicked() {
    print("\n\n========\n\nonClicked");
  }
  
  ///  Will be fired whenever the customer cancels the payment. This will reload the button once again
   onCanceled() {
    print("\n\n========\n\nonCanceled");
  }
```

#  Full Code Sample

[](https://developers.tap.company/docs/pay-button-ios#full-code-sample)

Once all of the above steps are successfully completed, your PayButton file should look like this:
```dart
import 'package:flutter/material.dart';  
import 'package:pay_button_flutter/enums/enums.dart';  
import 'package:pay_button_flutter/pay_button_flutter.dart';  
  
class PayButtonScreen extends StatefulWidget {   
  const PayButtonScreen({super.key});  
  
  @override  
  State<PayButtonScreen> createState() => _PayButtonScreenState();  
}  
  
class _PayButtonScreenState extends State<PayButtonScreen> {  
  String sdkResponse = "";

 Map<String,dynamic> configDict =  {
      "operator": {"publicKey": "pk_test_6jdl4Qo0FYOSXmrZTR1U5EHp", "hashString": ""},
      "scope": "charge",
      "transaction": {
        "authentication": true,
        "authorize": {
          "type": "VOID",
          "time": 12,
        },
        "paymentAgreement": {
          "id": "",
          "contract": {"id": ""},
        },
        "reference": "trx",
        "metadata": {},
      },
      "order": {
        "id": "",
        "amount": 0.1,
        "currency": "KWD",
        "description": "Authentication description",
        "reference": "ordRef",
        "metadata": {},
      },
      "invoice": {"id": ""},
      "merchant": {"id": ""},
      "customer": {
        "id": "",
        "name": [{"lang": "en", "first": "TAP", "middle": "", "last": "PAYMENTS"}],
        "contact": {
          "email": "tap@tap.company",
          "phone": {"countryCode": "+965", "number": "88888888"},
        },
      },
      "interface": {
        "locale": "en",
        "theme": "light",
        "edges": "curved",
        "colorStyle": "colored",
        "loader": true,
      },
      "post": {"url": ""},
    }

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
          configDict: configDict,  
          payButtonType: ButtonType.BENEFITPAY,  
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


```


# Parameters Reference[](https://developers.tap.company/docs/pay-button-ios#parameters-reference)

Below you will find more details about each parameter shared in the above tables that will help you easily integrate PayButton-iOS SDK.

## operator[](https://developers.tap.company/docs/pay-button-ios#operator)

1.  Definition: It links the payment gateway to your merchant account with Tap, in order to know your business name, logo, etc...
2.  Type: string (_required_)
3.  Fields:
    -   **publicKey**  
        _Definition_: This is a unique public key that you will receive after creating an account with Tap which is considered a reference to identify you as a merchant. You will receive 2 public keys, one for sandbox/testing and another one for production.
4. Example:

```dart
{ "operator":{"publicKey":"pk_test_YhUjg9PNT8oDlKJ1aE2fMRz7", "hashString":""}
```

## scope[](https://developers.tap.company/docs/pay-button-ios#scope)

1.  Definition: The scope of the current charge.
2.  Type: string (_optional_)
3.  Values:
    -   **charge**  
        _Definition_: The scope/intention of the current order to `charge` the customer. Default
    -   **authorize**  
        _Definition_: The scope/intention of the current order to `authorize` an amount from the customer.
4. Example:

```dart
"scope":"charge"
```

##  order [](https://developers.tap.company/docs/pay-button-ios#order)

1.  Definition: This defined the details of the order that you are trying to purchase, in which you need to specify some details like the id, amount, currency ...
2.  Type: Dictionary, (_required_)
3.  Fields:
    -   **id**  
        _Definition:_  Pass the order ID created for the order you are trying to purchase, which will be available in your database.  
        Note: This field can be empty
    -   **currency**  
        _Definition:_  The currency which is linked to the order being paid.
    -   **amount**  
        _Definition:_  The order amount to be paid by the customer.  
        Note: Minimum amount to be added is 0.1.
    -   **description**  
        _Definition:_  Order details, which defines what the customer is paying for or the description of the service you are providing.
    -   **reference**  
        _Definition:_  This will be the order reference present in your database in which the paying is being done for.
4.  _Example:_
  ```dart
  { "order": {
      "id": "", "amount": 1, "currency": "SAR", "description": "Authentication description",
      "reference": "",
    }
  ```

##  transaction [](https://developers.tap.company/docs/pay-button-ios#transaction)

1.  Definition: This defined the details of the order that you are trying to purchase, in which you need to specify some details like the reference, scope...
2.  Type: Dictionary, (optional)
3.  Fields:
    -   **authentication**  
        _Definition:_  If true, this means that the payment will not be accepted if it is card based and the card is not supporting 3DS.  
        Note: Default is true.
    -   **authorize**  
        _Definition:_  Defines the authorize details if the scope is set to authorize. Note, that not all buttons support authorize scope.
        - Fields:
            - type:
                - Definition: An enum to define the post action of the authorize.
                - Values:
                    - VOID // Will release the held amount
                    - CAPTURE // Will charge the held amount
            - time:
                - Definition: An hour based time to perform the post authorize action.
    -   **paymentAgreement**  
        _Definition:_  If you have created an agreement before, and you want to use it in this transaction pass its id here.
        Note: It can be empty. Only, related to card based buttons.
    -   **reference**  
        _Definition:_  This will be the transaction reference present in your database in which the paying is being done for.
4.  _Example:_
  ```dart
 { "transaction": {
    "authentication": true,
    "authorize": {
      "type": "VOID",
      "time": 12,
    {,
    "paymentAgreement": {
      "id": "",
      "contract": {"id": ""},
    },
    "reference": "trx",
    "metadata": {},
  }
  ```


##  merchant

[](https://developers.tap.company/docs/pay-button-ios#merchant)

1.  Definition: It is the Merchant id that you get from our onboarding team. This will be used as reference for your account in Tap.
2.  Type: Dictionary (_required_)
3.  Fields:
    -   **id**  
        _Definition:_  Generated once your account with Tap is created, which is unique for every merchant.  
        _Example:_
```dart
	{ "merchant":{"id":""}
```


##  invoice [](https://developers.tap.company/docs/pay-button-ios#invoice)

1.  Definition: After the token is generated, you can use it to pay for any invoice. Each invoice will have an invoice ID which you can add here using the SDK.  
    Note: An invoice will first show you a receipt/summary of the order you are going to pay for as well as the amount, currency, and any related field before actually opening the payment form and completing the payment.
2.  Type: Dictionary (_optional_)
3.  Fields:
    -   **id**  
        _Definition:_  Unique Invoice ID which we are trying to pay.  
        _Example:_
```dart
{"invoice":{"id":""}
```


## customer [](https://developers.tap.company/docs/pay-button-ios#customer)

1.  Definition: Here, you will collect the information of the customer that is paying..

2.  Type: Dictionary (_required_)

3.  Fields:

    -   **id**  
        _Definition:_  This is an optional field that you do not have before the charge is processed. But, after the charge, then you will receive the customer ID in the response which can be handled in the onSuccess callback function.
    -   **name**  
        _Definition:_  Full Name of the customer paying.  
        _Fields:_

        1.  **lang**  
            Definition: Language chosen to write the customer name.
        2.  **first**  
            Definition: Customer's first name.
        3.  **middle**  
            Definition: Customer's middle name.
        4.  **last**  
            Definition: Customer's last name.
    -   **contact**  
        _Definition:_  The customer's contact information like email address and phone number.  
        Note: The contact information has to either have the email address or the phone details of the customers or both but it should not be empty.  
        _Fields:_

        1.  **email**  
            Definition: Customer's email address  
            Note: The email is of type string.
        2.  **phone**  
            Definition: Customer's Phone number details
            1.  **countryCode**
            2.  **number**
4.  _Example:_
```dart
{ "customer": {
      "id": "", "name": [{"lang": "en", "first": "TAP", "middle": "", "last": "PAYMENTS"}],
      "contact": {
        "email": "tap@tap.company", "phone": {"countryCode": "+965", "number": "88888888"},
      },
    }
```


##  interface [](https://developers.tap.company/docs/pay-button-ios#interface)

1.  Definition: This will help you control the layout (UI) of the payment form, like changing the theme light to dark, the language used (en or ar), ...
2.  Type: Dictionary (_optional_)
3.  Fields:
    -   **loader**  
        _Definition:_  A boolean to indicate wether or not you want to show a loading view on top of the benefit button while it is performing api requests.
    -   **locale**  
        _Definition:_  The language of the pay button. Accepted values as of now are:  
        _Possible Values:_

        1.  **en**(for english)
        2.  **ar**(for arabic).

    -   **theme**  
        _Definition:_  The display styling of the pay button. Accepted values as of now are:  
        _Options:_

        1.  **light**
        2.  **dark**
        3.  **dynamic**  ( follow the device's display style )

    -   **edges**  
        _Definition:_  Control the edges of the payment form.  
        _Possible Values:_

        1.  **curved**
        2.  **flat**

    -   **colorStyle**  
        _Definition:_  How do you want the icons rendered inside the pay button
        _Possible Values:_

        1.  **colored**
        2.  **monochrome**
4.  _Example:_
```dart
{ "interface": {
      "locale": "en", "theme": "light", "edges": "curved",
      "colorStyle": "colored", "loader": true,
    }
```


##  post [](https://developers.tap.company/docs/pay-button-ios#post)

1.  Definition: Here you can pass the webhook URL you have, in order to receive notifications of the results of each Transaction happening on your application.

2.  Type: Dictionary (_optional_)

3.  Fields:

    -   **url**  
        _Definition:_  The webhook server's URL that you want to receive notifications on.  
        _Example:_
```dart
{ "post":{"url":""}
```        

# Available Button Types[](https://developers.tap.company/docs/pay-button-ios#available-button-types)

1. BenefitPay
2. KNET
3. Benefit
4. FAWRY
5. PAYPAL
6. TABBY
7. GOOGLEPAY



# Generate the hash string[](https://developers.tap.company/docs/benefit-pay-ios#generate-the-hash-string)

1. Add the dependency ``` crypto: Latest version```
2. Copy this helper method code
```dart
/**
     This is a helper method showing how can you generate a hash string when performing live charges
     - Parameter publicKey:             The Tap public key for you as a merchant pk_.....
     - Parameter secretKey:             The Tap secret key for you as a merchant sk_.....
     - Parameter amount:                The amount you are passing to the SDK, ot the amount you used in the order if you created the order before.
     - Parameter currency:              The currency code you are passing to the SDK, ot the currency code you used in the order if you created the order before. PS: It is the capital case of the 3 iso country code ex: SAR, KWD.
     - Parameter post:                  The post url you are passing to the SDK, ot the post url you pass within the Charge API. If you are not using postUrl please pass it as empty string
     - Parameter transactionReference:  The reference.trasnsaction you are passing to the SDK(not all SDKs supports this,) or the reference.trasnsaction  you pass within the Charge API. If you are not using reference.trasnsaction please pass it as empty string
     */
    String generateTapHashString(  
        String publicKey,  
        String secretKey,  
        double amount,  
        String currency, {  
        String postUrl = "",  
        String transactionReference = "",  
     }) {  
       // Let us generate our encryption key  
       var key = utf8.encode(secretKey);  
       // For amounts, you will need to make sure they are formatted in a way to have     the correct number of decimal points. For BHD we need them to have 3 decimal points  
       var formattedAmount = amount.toStringAsFixed(3);  
       // Let us format the string that we will hash  
       var toBeHashed = 'x_publickey$publicKey'  
       'x_amount$formattedAmount'  
       'x_currency$currency'  
       'x_transaction$transactionReference'  
       'x_post$postUrl';  
       // let us generate the hash string now using the HMAC SHA256 algorithm  
       var hmacSha256 = Hmac(sha256, key);  
       var signature = hmacSha256.convert(utf8.encode(toBeHashed));  
       var hashedString = signature.toString();  
       return hashedString;  
    }
```
4. Call it as follows:
```dart
String hashString = generateTapHashString(publicKey: publicKey, secretKey: secretString, amount: amount, currency: currency, postUrl: postUrl);
```
5. Pass it within the operator model
```dart
{ "operatorModel": {"publicKey": "pk_test_HJN863LmO15EtDgo9cqK7sjS", "hashString": hashString } }
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_button_flutter/enums/enums.dart';
import 'package:pay_button_flutter_example/src/pay_button_screen.dart';
import 'package:pay_button_flutter_example/src/utils/utils.dart';

import 'models/models.dart';
import 'multi_value_selection_screen.dart';
import 'widgets/widgets.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  /// Bool Selection
  /// Variable Declaration
  bool editable = true;
  bool acceptanceBadge = true;
  bool scanner = true;
  bool nfc = false;
  bool saveCard = true;
  bool autoSaveCard = true;
  bool cardHolder = true;
  bool cvv = true;
  bool loader = true;

  /// Text Form Fields
  /// Variable Declaration
  TextEditingController publicKeyController = TextEditingController(
    text: "pk_test_6jdl4Qo0FYOSXmrZTR1U5EHp",
  );
  TextEditingController transactionReferenceController = TextEditingController(
    text: "trx",
  );
  TextEditingController transactionAuthorizeTypeController =
      TextEditingController(
    text: "VOID",
  );
  TextEditingController transactionAuthorizeTimeController =
      TextEditingController(
    text: "12",
  );

  TextEditingController transactionIdController = TextEditingController();
  TextEditingController transactionContractIdController =
      TextEditingController();
  TextEditingController orderIdController = TextEditingController();
  TextEditingController orderReferenceController = TextEditingController(
    text: "orderRef",
  );

  TextEditingController orderAmountController = TextEditingController(
    text: "0.10",
  );
  TextEditingController orderCurrencyController = TextEditingController(
    text: "KWD",
  );
  TextEditingController orderDescriptionController = TextEditingController(
    text: "Authentication description",
  );
  TextEditingController linkToAnInvoiceController = TextEditingController();
  TextEditingController merchantIdController = TextEditingController();
  TextEditingController customerIdController = TextEditingController();
  TextEditingController nameOnCardController = TextEditingController(
    text: "TAP PAYMENTS",
  );

  /// Scope
  /// List of scope for the user selection
  /// List & Variable Declaration

  String selectedScopeValue = "charge";
  List<String> scopeList = [
    "charge",
    "authorize",
    "taptoken",
    "googlepaytoken",
  ];

  /// Button
  /// List of buttons for the user selection
  /// List & Variable Declaration

  ButtonType selectedButtonValue = ButtonType.BENEFITPAY;
  List<String> buttonsList = [
    ButtonType.BENEFITPAY.name,
    ButtonType.KNET.name,
    ButtonType.BENEFIT.name,
    ButtonType.FAWRY.name,
    ButtonType.PAYPAL.name,
    ButtonType.TABBY.name,
    ButtonType.GOOGLEPAY.name,
  ];

  /// Purpose
  /// List of purpose for the user selection
  /// List & Variable Declaration

  String selectedPurposeValue = "Transaction";
  List<String> purposeList = [
    "Transaction",
    "Save Card",
    "Verify Cardholder",
    "Order Transaction",
    "Subscription Transaction",
    "Billing Transaction",
    "Installment Transaction",
    "Milestone Transaction",
    "Maintain Card"
  ];

  /// Locale
  /// List of locale for the user selection
  /// List & Variable Declaration
  String selectedLocaleValue = "en";
  List<String> localeList = ["en", "ar"];

  /// Theme
  /// List of theme for the user selection
  /// List & Variable Declaration
  String selectedThemeValue = "light";
  List<String> themeList = ["light", "dark"];

  /// Edges
  /// List of edges for the user selection
  /// List & Variable Declaration
  String selectedEdgesValue = "curved";
  List<String> edgesList = ["curved", "flat"];

  /// Card Direction
  /// List of card direction for the user selection
  /// List & Variable Declaration
  String selectedCardDirectionValue = "dynamic";
  List<String> cardDirectionList = ["ltr", "rtl", "dynamic"];

  /// Color style
  /// List of color style for the user selection
  /// List & Variable Declaration
  String selectedColorStyleValue = "colored";

  List<String> colorStyleList = ["colored", "monochrome"];

  /// Supported Schemes
  /// List of Supported Schemes for the user selection
  /// List & Variable Declaration

  List<AcceptanceMultiSelectionModel> supportedSchemes = [
    AcceptanceMultiSelectionModel(
      title: "AMERICAN_EXPRESS",
      isSelected: true,
    ),
    AcceptanceMultiSelectionModel(
      title: "MADA",
      isSelected: true,
    ),
    AcceptanceMultiSelectionModel(
      title: "MASTERCARD",
      isSelected: true,
    ),
    AcceptanceMultiSelectionModel(
      title: "VISA",
      isSelected: true,
    ),
    AcceptanceMultiSelectionModel(
      title: "OMANNET",
      isSelected: true,
    ),
    AcceptanceMultiSelectionModel(
      title: "MEEZA",
      isSelected: false,
    ),
  ];

  List<String>? selectedSupportedSchemes = [
    "AMERICAN_EXPRESS",
    "MADA",
    "MASTERCARD",
    "VISA",
    "OMANNET"
  ];

  /// Supported Fund Source
  /// List of Supported Fund Source for the user selection
  /// List & Variable Declaration

  List<AcceptanceMultiSelectionModel> supportedFundSourceList = [
    AcceptanceMultiSelectionModel(
      title: "DEBIT",
      isSelected: true,
    ),
    AcceptanceMultiSelectionModel(
      title: "CREDIT",
      isSelected: true,
    ),
  ];

  List<String>? selectedSupportedFundSources = ["DEBIT", "CREDIT"];

  /// Supported Payment Authentications
  /// List of Supported Payment Authentications for the user selection
  /// List & Variable Declaration

  List<AcceptanceMultiSelectionModel> supportedPaymentAuthenticationsList = [
    AcceptanceMultiSelectionModel(
      title: "3DS",
      isSelected: true,
    ),
  ];

  List<String>? selectedPaymentAuthentications = ["3DS"];

  // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  void _showSingleValueSelectionActionSheet({
    required BuildContext context,
    required List<String> items,
    bool? buttonSelection,
    bool? scopeSelection,
    bool? purposeSelection,
    bool? localeSelection,
    bool? themeSelection,
    bool? edgesSelection,
    bool? cardDirectionSelection,
    bool? colorStyleSelection,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: CupertinoColors.activeBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: items.map(
            (e) {
              return CupertinoActionSheetAction(
                onPressed: () {
                  if (buttonSelection == true) {
                    if (e.toString() == ButtonType.BENEFITPAY.name) {
                      setState(() {
                        selectedButtonValue = ButtonType.BENEFITPAY;
                      });
                    }
                    if (e.toString() == ButtonType.BENEFIT.name) {
                      setState(() {
                        selectedButtonValue = ButtonType.BENEFIT;
                      });
                    }
                    if (e.toString() == ButtonType.GOOGLEPAY.name) {
                      setState(() {
                        selectedButtonValue = ButtonType.GOOGLEPAY;
                      });
                    }
                    if (e.toString() == ButtonType.KNET.name) {
                      setState(() {
                        selectedButtonValue = ButtonType.KNET;
                      });
                    }
                    if (e.toString() == ButtonType.FAWRY.name) {
                      setState(() {
                        selectedButtonValue = ButtonType.FAWRY;
                      });
                    }
                    if (e.toString() == ButtonType.PAYPAL.name) {
                      setState(() {
                        selectedButtonValue = ButtonType.PAYPAL;
                      });
                    }
                    if (e.toString() == ButtonType.TABBY.name) {
                      setState(() {
                        selectedButtonValue = ButtonType.TABBY;
                      });
                    }
                  }
                  if (scopeSelection == true) {
                    setState(() {
                      selectedScopeValue = e;
                    });
                  }

                  if (purposeSelection == true) {
                    setState(() {
                      selectedPurposeValue = e;
                    });
                  }
                  if (localeSelection == true) {
                    setState(() {
                      selectedLocaleValue = e;
                    });
                  }
                  if (themeSelection == true) {
                    setState(() {
                      selectedThemeValue = e;
                    });
                  }
                  if (edgesSelection == true) {
                    setState(() {
                      selectedEdgesValue = e;
                    });
                  }
                  if (cardDirectionSelection == true) {
                    setState(() {
                      selectedCardDirectionValue = e;
                    });
                  }
                  if (colorStyleSelection == true) {
                    setState(() {
                      selectedColorStyleValue = e;
                    });
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  e,
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontWeight:
                        e == "Cancel" ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            },
          ).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Configurations"),
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
      ),
      body: RawScrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            gapH24,
            const LabelTextWidget(label: "Button"),
            gapH4,
            SingleValueSelectionWidget(
              keyName: 'Button',
              selectedValueName: selectedButtonValue.name,
              onTap: () {
                _showSingleValueSelectionActionSheet(
                  context: context,
                  items: buttonsList,
                  buttonSelection: true,
                );
              },
            ),
            gapH24,
            const LabelTextWidget(label: "Operator"),
            gapH4,
            CustomInputFieldWidget(
              fieldName: 'Tap public key',
              controller: publicKeyController,
            ),
            const CustomDividerWidget(),
            CustomInputFieldWidget(
              fieldName: 'A hashstring to validate',
              controller: TextEditingController(),
              hintText: "Leave empty for auto generate",
            ),
            gapH24,
            const LabelTextWidget(label: "Scope"),
            gapH4,
            SingleValueSelectionWidget(
              keyName: 'Scope',
              selectedValueName: selectedScopeValue,
              onTap: () {
                _showSingleValueSelectionActionSheet(
                  context: context,
                  items: scopeList,
                  scopeSelection: true,
                );
              },
            ),
            gapH24,
            const LabelTextWidget(label: "Transaction"),
            gapH4,
            CustomInputFieldWidget(
              fieldName: 'Trx ref',
              controller: transactionReferenceController,
              hintText: "",
            ),
            const CustomDividerWidget(),
            CustomInputFieldWidget(
              fieldName: 'transaction.authorizetype',
              controller: transactionAuthorizeTypeController,
              hintText: "",
            ),
            const CustomDividerWidget(),
            CustomInputFieldWidget(
              fieldName: 'transaction.authorizetime',
              controller: transactionAuthorizeTimeController,
              hintText: "",
            ),
            gapH24,
            const LabelTextWidget(label: "Order"),
            gapH4,
            CustomInputFieldWidget(
              fieldName: 'Tap order id',
              controller: orderIdController,
              hintText: "Enter your order id",
            ),
            const CustomDividerWidget(),
            CustomInputFieldWidget(
              fieldName: 'order amount',
              controller: orderAmountController,
            ),
            const CustomDividerWidget(),
            CustomInputFieldWidget(
              fieldName: 'order currency',
              controller: orderCurrencyController,
            ),
            const CustomDividerWidget(),
            CustomInputFieldWidget(
              fieldName: 'order description',
              controller: orderDescriptionController,
            ),
            const CustomDividerWidget(),
            CustomInputFieldWidget(
              fieldName: 'order reference',
              controller: orderReferenceController,
            ),
            gapH24,
            const LabelTextWidget(label: "Invoice"),
            gapH4,
            CustomInputFieldWidget(
              fieldName: 'Link to an invoice',
              controller: linkToAnInvoiceController,
              hintText: "Enter your invoice id",
            ),
            gapH24,
            const LabelTextWidget(label: "Merchant"),
            gapH4,
            CustomInputFieldWidget(
              fieldName: 'Tap merchant id',
              controller: merchantIdController,
              hintText: "Enter your merchant id",
            ),
            gapH24,
            const LabelTextWidget(label: "Customer"),
            gapH4,
            CustomInputFieldWidget(
              fieldName: 'Customer id',
              controller: customerIdController,
              hintText: "Enter customer's id",
            ),
            gapH24,
            const LabelTextWidget(label: "Acceptance"),
            gapH4,
            ListSelectionWidget(
              keyName: 'supportedSchemes',
              selectedValueName: selectedSupportedSchemes == null
                  ? ""
                  : selectedSupportedSchemes!.join(", "),
              onTap: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiValuesSelectionScreen(
                      title: "supportedSchemes",
                      list: supportedSchemes,
                    ),
                  ),
                );
                debugPrint("Selected supportedFundSource >>>> $result");

                if (result != null) {
                  selectedSupportedSchemes = result;
                  setState(() {});
                } else {
                  selectedSupportedSchemes = null;
                  setState(() {});
                }
              },
            ),
            const CustomDividerWidget(),
            ListSelectionWidget(
              keyName: 'supportedFundSource',
              selectedValueName: selectedSupportedFundSources == null
                  ? ""
                  : selectedSupportedFundSources!.join(", "),
              onTap: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiValuesSelectionScreen(
                      title: "supportedFundSource",
                      list: supportedFundSourceList,
                    ),
                  ),
                );

                debugPrint("Selected supportedFundSource >>>> $result");

                if (result != null) {
                  selectedSupportedFundSources = result;
                  setState(() {});
                } else {
                  selectedSupportedFundSources = null;
                  setState(() {});
                }
              },
            ),
            const CustomDividerWidget(),
            ListSelectionWidget(
              keyName: 'supportedPaymentAuthentications',
              selectedValueName: selectedPaymentAuthentications == null
                  ? ""
                  : selectedPaymentAuthentications!.join(""),
              onTap: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiValuesSelectionScreen(
                      title: "supportedPaymentAuthentications",
                      list: supportedPaymentAuthenticationsList,
                    ),
                  ),
                );

                debugPrint(
                    "Selected supportedPaymentAuthentications >>>> $result");

                if (result != null) {
                  selectedPaymentAuthentications = result;
                  setState(() {});
                } else {
                  selectedPaymentAuthentications = null;
                  setState(() {});
                }
              },
            ),
            gapH24,
            const LabelTextWidget(label: "Interface"),
            gapH4,
            const CustomDividerWidget(),
            SingleValueSelectionWidget(
              keyName: 'locale',
              selectedValueName: selectedLocaleValue,
              onTap: () {
                _showSingleValueSelectionActionSheet(
                  context: context,
                  items: localeList,
                  localeSelection: true,
                );
              },
            ),
            const CustomDividerWidget(),
            SingleValueSelectionWidget(
              keyName: 'theme',
              selectedValueName: selectedThemeValue,
              onTap: () {
                _showSingleValueSelectionActionSheet(
                  context: context,
                  items: themeList,
                  themeSelection: true,
                );
              },
            ),
            const CustomDividerWidget(),
            SingleValueSelectionWidget(
              keyName: 'edges',
              selectedValueName: selectedEdgesValue,
              onTap: () {
                _showSingleValueSelectionActionSheet(
                  context: context,
                  items: edgesList,
                  edgesSelection: true,
                );
              },
            ),
            const CustomDividerWidget(),
            SingleValueSelectionWidget(
              keyName: 'colorStyle',
              selectedValueName: selectedColorStyleValue,
              onTap: () {
                _showSingleValueSelectionActionSheet(
                  context: context,
                  items: colorStyleList,
                  colorStyleSelection: true,
                );
              },
            ),
            const CustomDividerWidget(),
            SwitchListTileWidget(
              title: "loader",
              value: loader,
              onChange: (value) {
                setState(() {
                  loader = value!;
                });
              },
            ),
            gapH40,
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayButtonScreen(
                        sdkConfiguration: {
                          "dictionaryHashMap": {
                            "transaction": {
                              "paymentAgreement": const {
                                "id": "",
                                "contract": {"id": ""}
                              },
                              "reference": transactionReferenceController.text,
                              "metadata": const {"abc": "abc"},
                              "authorize": {
                                "type": transactionAuthorizeTypeController.text,
                                "time": transactionContractIdController.text,
                              },
                              "authentication": true
                            },
                            "scope": selectedScopeValue,
                            "invoice": {
                              "id": linkToAnInvoiceController.text,
                            },
                            "customer": {
                              "name": const [
                                {
                                  "last": "PAYMENTS",
                                  "first": "TAP",
                                  "lang": "en",
                                  "middle": ""
                                }
                              ],
                              "contact": const {
                                "email": "tap@tap.company",
                                "phone": {
                                  "countryCode": "+965",
                                  "number": "88888888"
                                }
                              },
                              "id": customerIdController.text,
                            },
                            "post": const {"url": ""},
                            "merchant": {
                              "id": merchantIdController.text,
                            },
                            "order": {
                              "id": orderIdController.text,
                              "amount": orderAmountController.text,
                              "currency": orderCurrencyController.text,
                              "reference": orderReferenceController.text,
                              "description": orderDescriptionController.text,
                              "metadata": const {
                                "abc": "abc",
                              }
                            },
                            "operator": {
                              "publicKey": publicKeyController.text,
                              "hashString": "",
                            },
                            "acceptance": {
                              "supportedFundSource":
                                  selectedSupportedFundSources,
                              "supportedPaymentAuthentications":
                                  selectedPaymentAuthentications,
                              "supportedSchemes": selectedSupportedSchemes,
                            },
                            "interface": {
                              "colorStyle": selectedColorStyleValue,
                              "powered": true,
                              "edges": selectedEdgesValue,
                              "theme": selectedThemeValue,
                              "loader": selectedLocaleValue,
                              "locale": selectedLocaleValue,
                            }
                          },
                        },
                        buttonType: selectedButtonValue,
                      ),
                    ),
                  );
                },
                child: const Text("Next"),
              ),
            ),
            gapH40,
          ],
        ),
      ),
    );
  }
}

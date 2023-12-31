import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleValueSelectionWidget extends StatelessWidget {
  final String keyName, selectedValueName;
  final Function()? onTap;

  const SingleValueSelectionWidget({
    super.key,
    required this.keyName,
    required this.onTap,
    required this.selectedValueName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  keyName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: onTap,
                  child: SizedBox(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        selectedValueName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: CupertinoColors.placeholderText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

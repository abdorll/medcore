import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../utils/color.dart';

// ignore: must_be_immutable
class OtpField extends StatefulWidget {
  int inputFieldLength;

  OtpField({this.inputFieldLength = 4, this.size = 56, this.color, super.key});
  Color? color;
  double size;
  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late TextEditingController pinController;
  late FocusNode focusNode;
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    pinController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Pinput(
          controller: pinController,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          length: widget.inputFieldLength,
          focusNode: focusNode,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          listenForMultipleSmsOnAndroid: true,
          defaultPinTheme:
              defaultPinTheme(size: widget.size, color: widget.color),
          separatorBuilder: (index) => const SizedBox(width: 8),
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: (pin) {
            debugPrint('onCompleted: $pin');
          },
          onChanged: (value) {
            debugPrint('onChanged: $value');
          },
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          obscureText: true,
          obscuringWidget: CircleAvatar(
            backgroundColor: black,
            radius: 10,
          ),
          focusedPinTheme:
              defaultPinTheme(size: widget.size, color: widget.color).copyWith(
            decoration: defaultPinTheme(size: widget.size, color: widget.color)
                .decoration!
                .copyWith(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: focusedBorderColor),
                ),
          ),
          // disabledPinTheme: ,
          submittedPinTheme:
              defaultPinTheme(size: widget.size, color: widget.color).copyWith(
            decoration: defaultPinTheme(size: widget.size, color: widget.color)
                .decoration!
                .copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: focusedBorderColor),
                ),
          ),
          errorPinTheme: defaultPinTheme(size: widget.size, color: widget.color)
              .copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}

final formKey = GlobalKey<FormState>();

Color focusedBorderColor = primaryColor;
Color fillColor = grey;

PinTheme defaultPinTheme({required double size, Color? color}) {
  return PinTheme(
    width: size,
    height: size - 10,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: color ?? Colors.grey.shade100,
      border: Border.all(color: color ?? grey),
    ),
  );
}

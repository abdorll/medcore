import 'package:flutter/material.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/views/set_your_fingerprint.dart';
import 'package:medcore/widget/custom_elevated_button.dart';
import 'package:medcore/widget/my_appbar.dart';
import 'package:medcore/widget/otp_field.dart';
import 'package:medcore/widget/spacing.dart';
import 'package:medcore/widget/texts.dart';

class AddPin extends StatefulWidget {
  static const String addPin = "addPin";
  const AddPin({super.key});

  @override
  State<AddPin> createState() => _AddPinState();
}

class _AddPinState extends State<AddPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: "Create New Pin", goBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                YMargin(MediaQuery.of(context).size.height * 0.08),
                Row(
                  children: [
                    Expanded(
                        child: TextOf(
                            "Add a PIN number to make your account more secure.",
                            18,
                            black,
                            FontWeight.w400)),
                  ],
                ),
                YMargin(70),
                OtpField(
                  inputFieldLength: 4,
                ),

                Expanded(child: YMargin(2))
                // YMargin(MediaQuery.of(context).size.height * 0.477),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom * 0.025),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(
                      text: "Continue",
                      onTap: () {
                        Navigator.pushNamed(
                            context, SetYourFingerprint.setYourFingerprint);
                      }),
                  YMargin(20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

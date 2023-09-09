import 'package:flutter/material.dart';
import 'package:medcore/helper/dialog.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/utils/images.dart';
import 'package:medcore/widget/custom_elevated_button.dart';
import 'package:medcore/widget/my_appbar.dart';
import 'package:medcore/widget/otp_field.dart';
import 'package:medcore/widget/spacing.dart';
import 'package:medcore/widget/texts.dart';

class SetYourFingerprint extends StatefulWidget {
  static const String setYourFingerprint = "setYourFingerprint";
  const SetYourFingerprint({super.key});

  @override
  State<SetYourFingerprint> createState() => _SetYourFingerprintState();
}

class _SetYourFingerprintState extends State<SetYourFingerprint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: "Set Your Fingerprint", goBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            YMargin(MediaQuery.of(context).size.height * 0.08),
            Row(
              children: [
                Expanded(
                    child: TextOf(
                        "Add a fingerprint to make your account more secure.",
                        18,
                        black,
                        FontWeight.w400)),
              ],
            ),
            YMargin(50),
            Image.asset(
              ImageOf.fingerprint,
              height: 250,
            ),
            YMargin(50),
            TextOf(
                "Please put your finger to on the fingerprint scanner to get started.",
                18,
                black,
                FontWeight.w400),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      text: "Skip",
                      onTap: () {
                        congratulate(context);
                      },
                      backgroundColor: Color(0xffF0F2FE),
                      textColor: primaryColor,
                      maximumSize: MaterialStatePropertyAll<Size>(
                          Size(MediaQuery.of(context).size.width * 0.4, 50)),
                    ),
                    XMargin(30),
                    CustomElevatedButton(
                      text: "Continue",
                      onTap: () {
                        congratulate(context);
                      },
                      maximumSize: MaterialStatePropertyAll<Size>(
                          Size(MediaQuery.of(context).size.width * 0.4, 50)),
                    ),
                  ],
                ),
                YMargin(40)
              ],
            )),
            //YMargin(MediaQuery.of(context).size.height * 0.2),
          ],
        ),
      ),
    );
  }
}

void congratulate(BuildContext context) {
  AlerDialog.showAlertDialog(context,
      title: "Congratulations!",
      subtitle:
          "Your account is ready to use. You will be redirected to the Home page in a few seconds ...",
      callBack: () {});
}

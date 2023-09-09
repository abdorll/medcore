import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/utils/images.dart';
import 'package:medcore/widget/spacing.dart';
import 'package:medcore/widget/texts.dart';

class AlerDialog {
  static showAlertDialog(BuildContext context,
      {required String title,
      required String subtitle,
      bool hasSkip = true,
      String? buttonText,
      required VoidCallback callBack}) {
    showDialog(
        barrierColor: black.withOpacity(0.7),
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            insetAnimationCurve: Curves.easeInCirc,
            insetPadding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(35)),
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageOf.congrats,
                    height: 170,
                  ),
                  const YMargin(30),
                  TextOf(title, 24, primaryColor, FontWeight.w700),
                  const YMargin(15),
                  TextOf(subtitle, 10, black, FontWeight.w400),
                  const YMargin(20),
                  const SpinKitFadingCircle(
                    size: 50,
                    color: primaryColor,
                  ),
                  const YMargin(10),
                ],
              ),
            ),
          );
        });
  }
}

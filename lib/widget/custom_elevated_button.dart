import 'package:flutter/material.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/widget/texts.dart';

@immutable
class CustomElevatedButton extends StatelessWidget {
  MaterialStatePropertyAll<Size>? maximumSize;

  CustomElevatedButton(
      {super.key,
      this.backgroundColor,
      required this.text,
      this.maximumSize,
      this.textColor,
      required this.onTap});
  Color? backgroundColor, textColor;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              elevation: 3,
              shadowColor: backgroundColor == null
                  ? primaryColor.withOpacity(0.5)
                  : backgroundColor!.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
            ).copyWith(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    backgroundColor ?? primaryColor),
                maximumSize: maximumSize ??
                    const MaterialStatePropertyAll<Size>(
                        Size(double.infinity, 50)),
                fixedSize: MaterialStateProperty.all<Size>(
                    const Size(double.maxFinite, 52))),
            onPressed: () {
              onTap();
            },
            child: TextOf(text, 12, textColor ?? white, FontWeight.w600)));
  }
}

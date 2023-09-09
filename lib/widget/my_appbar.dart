import "package:flutter/material.dart";
import "package:medcore/utils/color.dart";
import "package:medcore/widget/iconss.dart";
import "package:medcore/widget/texts.dart";

AppBar myAppbar(BuildContext context,
        {required String title, bool goBack = false}) =>
    AppBar(
      elevation: 0,
      leading: InkWell(
        child: IconOf(Icons.arrow_back, 20, black),
        onTap: () {
          goBack == true ? Navigator.pop(context) : () {};
        },
      ),
      title: TextOf(title, 23, black, FontWeight.w700),
    );

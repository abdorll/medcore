// import 'package:medcore/widget/iconss.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:medcore/utils/color.dart';

import 'package:flutter/material.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/widget/iconss.dart';
import 'package:google_fonts/google_fonts.dart';

class Inputfield extends StatefulWidget {
  Inputfield({
    required this.fieldName,
    required this.onChanged,
    this.isPassword = false,
    this.showVisibility = true,
    this.fillColor,
    this.hintColor,
    this.onTap,
    this.suffixIcon,
    this.inputType = TextInputType.emailAddress,
    Key? key,
  }) : super(key: key);
  Color? fillColor, hintColor;
  String fieldName;
  TextInputType inputType;
  VoidCallback? onTap;
  Widget? suffixIcon;
  bool isPassword, showVisibility;
  void Function(String?) onChanged;

  @override
  State<Inputfield> createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  bool obscureText = true;

  @override
  Container build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.fillColor ?? grey,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        onChanged: widget.onChanged,
        cursorColor: primaryColor,
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        keyboardType: widget.inputType,
        //keyboardAppearance: ,
        obscureText: widget.isPassword == true ? obscureText : false,
        style: GoogleFonts.poppins(
            color: black,
            decoration: TextDecoration.none,
            decorationColor: Colors.transparent),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.5, horizontal: 10),
          hintText: widget.fieldName,
          hintStyle: GoogleFonts.poppins(
              color: widget.hintColor ?? ash,
              fontWeight: FontWeight.w400,
              fontSize: 15),
          //  suffix: widget.suffixIcon ?? SizedBox.shrink(),

          suffixIconConstraints: const BoxConstraints(
              maxHeight: 30, maxWidth: 30, minHeight: 30, minWidth: 30),
          suffixIcon: widget.suffixIcon ?? const SizedBox.shrink(),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

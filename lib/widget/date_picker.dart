import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/utils/images.dart';
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';

class DateField extends StatelessWidget {
  DateField({super.key});
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(10)),
      child: TextfieldDateAndTimePicker(
        cupertinoDatePickerBackgroundColor: Colors.white,
        cupertinoDatePickerMaximumDate: DateTime(2099),
        cupertinoDatePickerMaximumYear: 2099,
        cupertinoDatePickerMinimumYear: 1990,
        cupertinoDatePickerMinimumDate: DateTime(1990),
        cupertinoDateInitialDateTime: DateTime.now(),
        materialDatePickerFirstDate: DateTime.now(),
        materialDatePickerInitialDate: DateTime.now(),
        materialDatePickerLastDate: DateTime(2099),
        preferredDateFormat: DateFormat.yMMMM(),
        materialTimePickerUse24hrFormat: false,
        cupertinoTimePickerMinuteInterval: 1,
        cupertinoTimePickerUse24hFormat: false,
        textfieldDateAndTimePickerController: _controller,
        style: GoogleFonts.poppins(
            color: black,
            decoration: TextDecoration.none,
            decorationColor: Colors.transparent),
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          //errorText: errorTextValue,
          helperStyle: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w700, color: ash),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide.none),
          hintText: 'Date of birth',

          suffix: ImageIcon(
            AssetImage(ImageOf.mailIcon),
            size: 30,
            color: ash,
          ),
          hintStyle:
              GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal),
          filled: true,
          fillColor: grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        materialInitialTime: TimeOfDay.now(),
      ),
    );
  }
}

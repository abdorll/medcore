import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/utils/images.dart';
import 'package:medcore/views/add_pin.dart';
import 'package:medcore/widget/custom_elevated_button.dart';
import 'package:medcore/widget/iconss.dart';
import 'package:medcore/widget/input_field.dart';
import 'package:medcore/widget/my_appbar.dart';
import 'package:medcore/widget/select_photo.dart';
import 'package:medcore/widget/spacing.dart';
import 'package:medcore/widget/texts.dart';

// ignore: must_be_immutable
class FillProfile extends StatefulWidget {
  static const String fillProfile = "fillProfile";
  FillProfile({super.key});
  static XFile? pickedImage;
  //set setPickedImage(e) => pickedImage = e;
  // XFile get getImage => pickedImage;
  State<FillProfile> createState() => _FillProfile();
}

class _FillProfile extends State<FillProfile> {
  DateTime selectedDate = DateTime.now();

  String dateHint = "Date of birth";

  Color hintColor = ash;

  String dropdownValue = 'Gender';
  List<String> dropDownMenuItem = ["Male", "Female"];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
    return Scaffold(
      appBar: myAppbar(context, title: "Fill your profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const YMargin(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      if (FillProfile.pickedImage == null)
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset(
                              ImageOf.emptyProfileImage,
                              height: 200,
                            ),
                          ],
                        )
                      else
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      File(FillProfile.pickedImage!.path)))),
                        ),
                      Positioned(
                          bottom: 9,
                          right: 11,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) =>
                                      const SelectPhotoOptions());
                            },
                            child: Image.asset(
                              ImageOf.editIcon,
                              height: 39,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
              const YMargin(20),
              Inputfield(fieldName: "Full Name", onChanged: (_) {}),
              const YMargin(20),
              Inputfield(fieldName: "Nickname", onChanged: (_) {}),
              const YMargin(20),
              Inputfield(
                inputType: TextInputType.none,
                suffixIcon: IconOf(Icons.calendar_month_rounded, 20, ash),
                fieldName: dateHint,
                onChanged: (_) {},
                onTap: () {
                  _selectDate(context);
                },
                hintColor: hintColor,
              ),
              const YMargin(20),
              Inputfield(
                fieldName: "Email",
                onChanged: (_) {},
                inputType: TextInputType.emailAddress,
                suffixIcon: IconOf(Icons.mail_outline_rounded, 20, ash),
              ),
              const YMargin(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 16,
                      child: DropdownButton<String>(
                          isExpanded: true,
                          iconSize: 0,
                          hint: TextOf("Gender", 15, ash, FontWeight.w500),
                          style: GoogleFonts.poppins(
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                          icon: const Icon(Icons.expand_more_outlined),
                          padding: const EdgeInsets.all(0),
                          underline: const SizedBox.shrink(),
                          value: selectedValue,
                          items: dropDownMenuItem
                              .map((String e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          }),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconOf(Icons.expand_more_rounded, 20, ash))
                  ],
                ),
              ),
              const YMargin(30),
              CustomElevatedButton(
                  text: "Continue",
                  onTap: () {
                    Navigator.pushNamed(context, AddPin.addPin);
                    print(
                        "object============= ${FillProfile.pickedImage?.path}");
                  }),
              const YMargin(20)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1923, 8),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateHint = DateFormat.yMMMMd().format(selectedDate).toString();
        hintColor = black;
      });
    }
  }
}

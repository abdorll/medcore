import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/views/fill_profile.dart';
import 'package:medcore/widget/iconss.dart';
import 'package:medcore/widget/spacing.dart';
import 'package:medcore/widget/texts.dart';

class SelectPhotoOptions extends StatefulWidget {
  const SelectPhotoOptions({Key? key}) : super(key: key);

  @override
  State<SelectPhotoOptions> createState() => _SelectPhotoOptionsState();
}

class _SelectPhotoOptionsState extends State<SelectPhotoOptions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: TextOf(
                          "Select upload option", 13, black, FontWeight.w500)),
                  const YMargin(20),
                  clickOption(
                      icon: Icons.photo_camera_outlined,
                      text: "Take photo",
                      onTap: () {
                        pickImage(source: ImageSource.camera);
                      }),
                  const YMargin(30),
                  clickOption(
                      icon: Icons.photo_library_outlined,
                      text: "Select from gallery",
                      onTap: () {
                        pickImage(source: ImageSource.gallery);
                      }),
                  const YMargin(5)
                ])));
  }

  Future<void> pickImage({required ImageSource source}) async {
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: source).then((value) {
      setState(() {
        FillProfile.pickedImage = value;
      });

      print(
          "file is: ${FillProfile.pickedImage == null ? "null" : "not empty [${FillProfile.pickedImage!.path}]"}");
    });
    setState(() {});
  }
}

InkWell clickOption(
    {required IconData icon,
    required String text,
    required VoidCallback onTap}) {
  return InkWell(
    child: Row(
      children: [
        IconOf(icon, 20, primaryColor),
        const XMargin(10),
        TextOf(text, 12, black, FontWeight.w400)
      ],
    ),
    onTap: () {
      onTap();
    },
  );
}



///data/user/0/com.example.medcore/cache/032e7606-261a-41b5-b164-e65d06a3a4326621184927922180360.jpg
////data/user/0/com.example.medcore/cache/032e7606-261a-41b5-b164-e65d06a3a4326621184927922180360.jpg
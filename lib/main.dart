import 'package:flutter/material.dart';
import 'package:medcore/routes/app_routes.dart';
import 'package:medcore/utils/color.dart';
import 'package:medcore/utils/constants.dart';
import 'package:medcore/views/fill_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: FillProfile.fillProfile,
    );
  }
}

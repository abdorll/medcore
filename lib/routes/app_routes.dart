import 'package:flutter/material.dart';
import 'package:medcore/views/add_pin.dart';
import 'package:medcore/views/fill_profile.dart';
import 'package:medcore/views/set_your_fingerprint.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FillProfile.fillProfile:
        return screenOf(screenName: FillProfile());
      case AddPin.addPin:
        return screenOf(screenName: const AddPin());
      case SetYourFingerprint.setYourFingerprint:
        return screenOf(screenName: const SetYourFingerprint());
      default:
        return screenOf(screenName: Container());
    }
  }
}

MaterialPageRoute screenOf({required Widget screenName}) {
  return MaterialPageRoute(builder: (context) => screenName);
}

const assetPath = 'assets/images';
String image(String imageName, {String type = 'png'}) {
  return '$assetPath/$imageName.$type';
}

String svgImage(String imageName) {
  return '$assetPath/$imageName';
}

class ImageOf {
  static String calender = image('calender');
  static String congrats = image('congrats');
  static String back = image('back');
  static String splashScreenImage = image('splash_screen');
  static String editIcon = image('edit_icon');
  static String emptyProfileImage = image('empty_profile_image');
  static String mailIcon = image('mail_icon');
  static String profilePic = image('profile_pic');
  static String fingerprint = image('fingerprint');
}

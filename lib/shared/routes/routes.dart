import 'package:flutter/material.dart';

import '../../auth/login.dart';
import '../../auth/sign.dart';
import '../../chat/chatBot.dart';
import '../../home layouts/home.dart';
import '../../modules/About.dart';
import '../../modules/settings/settings.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'login': (context) => LoginPage(),
  'SignUp': (context) => const SignUpPage(),
  'Home Page': (context) => const HomePage(),
  'About': (context) => const AboutUs(),
  'Chat Bot': (context) => const ChatBot(),
  'Settings': (context) => const Settings(),
};

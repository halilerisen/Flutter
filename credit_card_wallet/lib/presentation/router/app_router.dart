import 'package:credit_card_wallet/presentation/screens/add_new_card_screens/add_new_card_screen.dart';
import 'package:credit_card_wallet/presentation/screens/add_new_card_screens/add_new_card_preview_screen.dart';
import 'package:credit_card_wallet/presentation/screens/authentication_screens/reset_password_screen/reset_password_screen.dart';
import 'package:credit_card_wallet/presentation/screens/authentication_screens/sign_in_screen.dart';
import 'package:credit_card_wallet/presentation/screens/authentication_screens/draw_sign_in_screen.dart';

import 'package:credit_card_wallet/presentation/screens/authentication_screens/draw_sign_up_screen.dart';
import 'package:credit_card_wallet/presentation/screens/home_screen/home_screen.dart';
import 'package:credit_card_wallet/presentation/screens/add_new_card_screens/add_new_card_result_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String resetPassword = 'resetPassword';

  static const String home = 'home';

  static const String addNewCard = 'addNewCard';
  static const String addNewCardResult = 'addNewCardResult';

  static const String drawCustomScreen = 'drawCustomScreen';
  static const String drawSignUpScreen = 'drawSignUpScreen';

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());

      case addNewCard:
        return MaterialPageRoute(builder: (_) => const AddNewCardScreen());

      case addNewCardResult:
        return MaterialPageRoute(builder: (_) => const AddNewCardResultScreen());

      case drawCustomScreen:
        return MaterialPageRoute(builder: (_) => const DrawSignInScreen());
      case drawSignUpScreen:
        return MaterialPageRoute(builder: (_) => const DrawSignUpScreen());

      default:
        return null;
    }
  }
}

import 'package:bank_app/screens/local_auth/method_one/confirm_password_screen.dart';
import 'package:bank_app/screens/local_auth/method_one/entry_password_screen.dart';
import 'package:bank_app/screens/local_auth/method_one/set_password_screen.dart';
import 'package:bank_app/screens/local_auth/method_two/touch_id_screen.dart';
import 'package:bank_app/screens/payment/payment_screen.dart';
import 'package:bank_app/screens/splash/splash_screen.dart';
import 'package:bank_app/screens/tab/card/add_card_screen.dart';
import 'package:bank_app/screens/tab/tab_screen.dart';
import 'package:bank_app/screens/transfer/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'auth/auth_screen.dart';
import 'auth/login.dart';
import 'no_internet/no_internet_screen.dart';
import 'on_boarding/ob_boarding_screen.dart';




class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.noInternetRoute:
        return navigate(NoInternetScreen(
            onInternetComeBack: settings.arguments as VoidCallback));

      case RouteNames.transferRoute:
        return navigate(const TransferScreen());
        case RouteNames.loginScreen:
        return navigate(const LoginScreen());
      case RouteNames.paymentRoute:
        return navigate(const PaymentScreen());
      case RouteNames.register:
        return navigate(const RegisterScreen());
      case RouteNames.onBoardingRoute:
        return navigate(const OnBoardingScreen());
      case RouteNames.confirmPassword:
        return navigate(const ConfirmPasswordScreen());
     case RouteNames.touchId:
        return navigate(const TouchIdScreen());
     case RouteNames.entryPassword:
        return navigate(const EntryPasswordScreen());
     case RouteNames.setPassword:
        return navigate(const SetPasswordScreen());
     case RouteNames.addCard:
        return navigate(const AddCardScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}


class RouteNames {
  static const String splashScreen = "/";
  static const String loginScreen = "/login";
  static const String tabRoute = "/tab_route";
  static const String register = "/auth_route";
  static const String addCard = "/add_cars_route";
  static const String touchId = "/touch_id_route";
  static const String confirmPassword = "/confirm_password_route";
  static const String entryPassword = "/entry_password_route";
  static const String setPassword = "/set_password_route";
  static const String noInternetRoute = "/no_internet_route";
  static const String paymentRoute = "/payment_route";
  static const String transferRoute = "/transfer_route";
  static const String onBoardingRoute = "/on_boarding_route";
}


import 'package:bank_app/screens/chat/chat_screen.dart';
import 'package:bank_app/screens/doctor_detail_screen/doctor_detail.dart';
import 'package:bank_app/screens/home/home_screen.dart';
import 'package:bank_app/screens/hospitel/akusher_screen.dart';
import 'package:bank_app/screens/hospitel/hosital_detail_screen.dart';
import 'package:bank_app/screens/hospitel/hospitel_screen.dart';
import 'package:bank_app/screens/hospitel/uzi_screen.dart';
import 'package:bank_app/screens/product/product_screen.dart';
import 'package:bank_app/screens/profile/user_profile.dart';
import 'package:bank_app/screens/schedule_tab/schedule_tab.dart';
import 'package:bank_app/screens/splash/splash_screen.dart';
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
      case RouteNames.noInternetRoute:
        return navigate(NoInternetScreen(
            onInternetComeBack: settings.arguments as VoidCallback));
        case RouteNames.loginScreen:
        return navigate(const LoginScreen());
      case RouteNames.register:
        return navigate(const RegisterScreen());
      case RouteNames.onBoardingRoute:
        return navigate(const OnBoardingScreen());
     case RouteNames.scheduleTab:
        return navigate(const ScheduleTab());
    case RouteNames.homeTabRoute:
        return navigate(const HomeScreen());
    case RouteNames.doctorDetail:
        return navigate(const SliverDoctorDetail());
    case RouteNames.profileRoute:
        return navigate(const ProfilePage());
        case RouteNames.confirmPassword:
        return navigate(const ProductScreen());
        case RouteNames.akusherRoute:
        return navigate(const AkusherScreen());
      case RouteNames.uziRoute:
        return navigate(const UZIScreen());
      case RouteNames.hotelRoute:
        return navigate(const HotelScreen());
        case RouteNames.hotelDetailRoute:
        return navigate(const HospitelDetail());
      case RouteNames.chat:
        return navigate(const ChatScreen());
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
  static const String homeTabRoute = "/tab_route";
  static const String register = "/auth_route";
  static const String akusherRoute = "/add_cars_route";
  static const String uziRoute = "/touch_id_route";
  static const String hotelRoute = "/confirm_password_route";
  static const String hotelDetailRoute = "/entry_password_route";
  static const String confirmPassword = "/set_password_route";
  static const String noInternetRoute = "/no_internet_route";
  static const String profileRoute = "/payment_route";
  static const String doctorDetail = "/transfer_route";
  static const String chat = "/chat_route";
  static const String onBoardingRoute = "/on_boarding_route";
  static const String  scheduleTab = "/schedule_tab_route";
}

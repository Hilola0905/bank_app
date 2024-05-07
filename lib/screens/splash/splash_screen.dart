import 'package:bank_app/blocs/auth/auth_bloc.dart';
import 'package:bank_app/blocs/auth/auth_state.dart';
import 'package:bank_app/blocs/user_profile/profile_bloc.dart';
import 'package:bank_app/blocs/user_profile/profile_event.dart';
import 'package:bank_app/data/model/form_status.dart';
import 'package:bank_app/utils/images/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../data/local/storage_repository.dart';
import '../../utils/size/screen_utils.dart';
import '../routes.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init(bool isAuth) async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    if (!mounted) return;
    if (isAuth==false) {
      bool isNewUser = StorageRepository.getBool(key: "is_new_user");
      if (isNewUser) {
        Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.onBoardingRoute);
      }
    }
    else {
      Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
    }
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context,state){
       if(state.formStatus==FormStatus.authenticated){
         BlocProvider.of<ProfileBloc>(context).add(
           GetProfileEvent(uid: FirebaseAuth.instance.currentUser!.uid)
         );
          _init(true);
       }else{
         _init(false);
       }
        },
        child: Center(
            child: Lottie.asset(
                AppImages.splashLottie
            )),
      ),
    );
  }
}
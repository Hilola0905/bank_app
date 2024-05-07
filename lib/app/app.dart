import 'package:bank_app/blocs/auth/auth_event.dart';
import 'package:bank_app/blocs/bottom/bottom_bloc.dart';
import 'package:bank_app/blocs/card/card_bloc.dart';
import 'package:bank_app/blocs/card/card_event.dart';
import 'package:bank_app/blocs/user_profile/profile_bloc.dart';
import 'package:bank_app/blocs/user_profile/profile_event.dart';
import 'package:bank_app/data/repository/card_repository.dart';
import 'package:bank_app/data/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../data/repository/auth_repository.dart';
import '../screens/routes.dart';
import '../service/local_notification_service.dart';
class App extends StatelessWidget {
  App({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    LocalNotificationService.localNotificationService.init(navigatorKey);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_)=>ProfileRepository()) ,
        RepositoryProvider(create: (_)=>CardRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
              AuthBloc(authRepository: context.read<AuthRepository>())..add(CheckedInitialEvent())),
          BlocProvider(
              create: (_) =>
              BottomBloc()),
          BlocProvider(
              create: (context) =>
                  ProfileBloc(profileRepository: context.read<ProfileRepository>())),
          BlocProvider(
              create: (context) =>
                  CardBloc(cardRepository: context.read<CardRepository>())..add(GetDataBaseCardEvent())),
        ],
        child: MaterialApp(
          theme: ThemeData(
              useMaterial3: false
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }

}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/connectivity/connectivity_bloc.dart';
import '../data/repository/auth_repository.dart';
import '../service/local_notification_service.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    LocalNotificationService.localNotificationService.init(navigatorKey);

    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (_) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ConnectivityBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
         // initialRoute: RouteNames.splashScreen,
          navigatorKey: navigatorKey,
         // onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}

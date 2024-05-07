import 'package:bank_app/blocs/bottom/bottom_bloc.dart';
import 'package:bank_app/blocs/bottom/bottom_event.dart';
import 'package:bank_app/blocs/bottom/bottom_state.dart';
import 'package:bank_app/screens/tab/card/card_screen.dart';
import 'package:bank_app/screens/tab/history/history_screen.dart';
import 'package:bank_app/screens/tab/home/home_screen.dart';
import 'package:bank_app/screens/tab/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Widget> screens = [
    const HomeScreen(),
    const CardScreen(),
    const HistoryScreen(),
    const  ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBloc,BottomState>(
      builder: (BuildContext context,BottomState state){
        return Scaffold(
          body: screens[state.index],
          bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) {
            context.read<BottomBloc>().add(BottomEvent(index: index));
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black87,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership,color: Colors.black87),
              label: "card",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history,color: Colors.black87),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black87),
              label: "Profile",
            ),
          ],
        ),
        );
      },
    );

  }
}

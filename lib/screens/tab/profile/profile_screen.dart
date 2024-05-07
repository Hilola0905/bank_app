import 'package:bank_app/blocs/user_profile/profile_bloc.dart';
import 'package:bank_app/blocs/user_profile/profile_state.dart';
import 'package:bank_app/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
        body: BlocBuilder<ProfileBloc,ProfileState>(
            builder: (BuildContext context,  state){
              return Column(
                children: [
                  Text(state.profileModel.userName,style: AppTextStyle.interSemiBold.copyWith(
                    color: Colors.black87,
                  ),),
                ],
              );
            }
        ),
    );
  }
}

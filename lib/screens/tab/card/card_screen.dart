import 'package:bank_app/blocs/card/card_bloc.dart';
import 'package:bank_app/blocs/card/card_state.dart';
import 'package:bank_app/data/model/card_model.dart';
import 'package:bank_app/screens/routes.dart';
import 'package:bank_app/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  Center(child: Text("Card",style: AppTextStyle.interMedium.copyWith(
          color: Colors.white,
          fontSize: 24
        ),)),
        actions: [
          IconButton(
            icon:  const Icon(Icons.add),
            onPressed: (){
              Navigator.pushNamed(context, RouteNames.addCard);
            },
          ),
        ],
        systemOverlayStyle: const  SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: BlocBuilder<CardBloc,CardState>(
        builder: (context,state){
          return ListView(
            children: [
              ...List.generate(state.userCards.length, (index) {
               CardModel card=state.userCards[index];
               return Container(
                 width: double.infinity,
                 height: 100,
                 color: Colors.green,
               );
          }),
            ],
          );
        },
      ),
    );
  }
}

import 'package:bank_app/blocs/card/card_event.dart';
import 'package:bank_app/utils/size/screen_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/card/card_bloc.dart';
import '../../../blocs/card/card_state.dart';
import '../../../data/model/card_model.dart';
import '../../../utils/style/app_text_style.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/rounded_button.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  Center(child: Text("Card",style: AppTextStyle.interMedium.copyWith(
            color: Colors.white,
            fontSize: 24
        ),)),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
        ],
        systemOverlayStyle: const  SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: BlocBuilder<CardBloc,CardState>(
        builder: (context,state){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Column(
              children: [
                MyTextFieldWidget(
                  keyBoardType: TextInputType.text,
                  controller: cardNumberController,
                  hintText: "Card Number",
                ),
                const SizedBox(height: 50,),
                MyTextFieldWidget(
                  keyBoardType: TextInputType.datetime,
                  controller: expireDateController,
                  hintText: "Expire Date",
                ),
                const SizedBox(height: 100,),
                Center(
                  child: SizedBox(
                    width: width * 0.8,
                    height: 46.h,
                    child: RoundedButton(
                      text: "add card",
                      onTap: () {
                         List<CardModel> card=state.userCards;
                         List<CardModel> db=state.dbCards;
                         bool isAdd=true;
                         for(CardModel i in card){
                           if(i.cardNumber==cardNumberController.text){
                             isAdd==false;
                             break;
                           }
                         }
                         bool isHave=false;
                         for(CardModel i in db){
                           if(i.cardNumber==cardNumberController.text){
                             isHave==true;
                             break;
                           }
                         }
                         if(isAdd==true && isHave==true){

                           context.read<CardBloc>().add(
                               AddCardEvent(
                                   cardModel: CardModel(
                               expireDate: expireDateController.text,
                               icon: "",
                               userId: "3UxMTk9Xmp7K9PnNrxh0",
                               cvc: "",
                               cardHolder:"",
                               bank: "",
                               cardId: "",
                               color: "",
                               type: 3,
                               cardNumber: cardNumberController.text,
                               balance: 13.000
                           )
                               ));
                         }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

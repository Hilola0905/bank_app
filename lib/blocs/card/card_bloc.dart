import 'package:bank_app/blocs/user_profile/profile_event.dart';
import 'package:bank_app/blocs/user_profile/profile_state.dart';
import 'package:bank_app/data/model/card_model.dart';
import 'package:bank_app/data/model/form_status.dart';
import 'package:bank_app/data/model/profile_model.dart';
import 'package:bank_app/data/network/response.dart';
import 'package:bank_app/data/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/card_repository.dart';
import 'card_event.dart';
import 'card_state.dart';


class CardBloc extends Bloc<CardEvent,CardState>{
  CardBloc({required this.cardRepository}):super(
     const  CardState(
      errorMessage: "",
      formStatus: FormStatus.pure,
      statusMessage: "",
      userCards: [],
       dbCards: [],
  )
  ){
    on<UpdateCardEvent>(_update);
    on<AddCardEvent>(_add);
    on<DeleteCardEvent>(_delete);
    on<GetCardEvent>(_listenCard);
    on<GetDataBaseCardEvent>(_listenCardDataBase);
  }
  final CardRepository cardRepository;
  _update(UpdateCardEvent event,  emit ) async {
    emit(state.copyWidth( formStatus:  FormStatus.loading));
    NetworkResponse networkResponse = await cardRepository.updateCard(event.cardModel);
    if(networkResponse.errorCode!.isNotEmpty){
      emit(
          state.copyWidth(
              formStatus: FormStatus.success,)
      );
    }else{
      emit(
          state.copyWidth(
            formStatus: FormStatus.error,errorMessage:  networkResponse.errorCode, )
      );
    }
  }
  _add(AddCardEvent event,  emit )async {

    emit(state.copyWidth(formStatus:FormStatus.loading, ));
    NetworkResponse networkResponse = await cardRepository.insertCard(event.cardModel);
    if(networkResponse.errorCode!.isNotEmpty){
      emit(
          state.copyWidth(
              formStatus: FormStatus.success)
      );
    }else{
      emit(
          state.copyWidth(
            formStatus:FormStatus.error, errorMessage:  networkResponse.errorCode,)
      );
    }
  }
  _delete(DeleteCardEvent event,  emit ) async {
    emit(state.copyWidth(formStatus:FormStatus.loading,));
    NetworkResponse networkResponse = await cardRepository.deleteCard(event.cardModel.userId);
    if(networkResponse.errorCode!.isNotEmpty){
      emit(
          state.copyWidth(
              formStatus: FormStatus.success,)
      );
    }else{
      emit(
          state.copyWidth(
            formStatus:FormStatus.error,errorMessage:  networkResponse.errorCode, )
      );
    }
  }

  _listenCard(GetCardEvent event, Emitter emit ) async {
   await  emit.onEach(cardRepository.getCardByUserId(event.uid),
        onData: ( List<CardModel> userCards){
         emit(state.copyWidth(userCards: userCards));
        },
    );
  }
  _listenCardDataBase(GetDataBaseCardEvent event, Emitter emit ) async {
    await  emit.onEach(cardRepository.getCardsDatabase(),
      onData: ( List<CardModel> userCards){
        emit(state.copyWidth(dbCards: userCards));
      },
    );
  }
}
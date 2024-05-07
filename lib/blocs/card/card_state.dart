import 'package:bank_app/data/model/card_model.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/form_status.dart';


class CardState extends Equatable {

  final  FormStatus formStatus;
  final String errorMessage;
  final String statusMessage;
  final List<CardModel> userCards;
  final List<CardModel> dbCards;
  const CardState({
    required this.errorMessage,
    required this.formStatus,
    required this.statusMessage,
    required this.userCards,
    required this.dbCards,
  });
  CardState copyWidth({
    FormStatus? formStatus,
    String? errorMessage,
    String? statusMessage,
    List<CardModel>? userCards,
    List<CardModel>? dbCards,
  } ){
    return CardState(
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      userCards:userCards ?? this.userCards,
      dbCards:dbCards ?? this.dbCards,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    statusMessage,
    errorMessage,
    formStatus,
  ];

}

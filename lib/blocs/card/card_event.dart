import 'package:equatable/equatable.dart';
import '../../data/model/card_model.dart';



class CardEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UpdateCardEvent extends CardEvent{
  final CardModel cardModel;
  UpdateCardEvent({required this.cardModel});
}
class InitialCardEvent extends CardEvent{}
class AddCardEvent extends CardEvent{
  final CardModel cardModel;
  AddCardEvent({required this.cardModel});
}
class DeleteCardEvent extends CardEvent{
  final CardModel cardModel;
  DeleteCardEvent({required this.cardModel});
}
class GetDataBaseCardEvent extends CardEvent{

  GetDataBaseCardEvent();
}
class GetCardEvent extends CardEvent{
  final String uid;
  GetCardEvent({required this.uid});
  @override
  // TODO: implement props
  List<Object?> get props => [uid];


}
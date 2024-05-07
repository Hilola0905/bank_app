
import 'package:bank_app/data/model/card_model.dart';
import 'package:bank_app/data/network/response.dart';
import 'package:bank_app/utils/contacts/app_contacts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardRepository{
  Future<NetworkResponse> insertCard(CardModel cardModel) async {
    try {
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection(AppConstants.card)
          .add(cardModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.card)
          .doc(documentReference.id)
          .update({"cardId": documentReference.id});
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.code);
    }
  }
  Future<NetworkResponse> updateCard(CardModel cardModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.card)
          .doc(cardModel.cardId).update(cardModel.toJsonForUpdate()
      );

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.code);
    }
  }
  Future<NetworkResponse> deleteCard(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.card)
          .doc(docId).delete();

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.code);
    }
  }
  Stream<List<CardModel>> getCardByUserId(String userId)=>
   FirebaseFirestore.instance
        .collection(AppConstants.card)
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map((event) =>
        event.docs.map((doc) => CardModel.fromJson(doc.data())).toList()
    );
  Stream<List<CardModel>> getCardsDatabase() => FirebaseFirestore.instance
        .collection(AppConstants.cardDatabase)
        .snapshots()
        .map((event) =>
        event.docs.map((doc) => CardModel.fromJson(doc.data())).toList()
    );
}
import 'package:bank_app/data/model/profile_model.dart';
import 'package:bank_app/data/network/response.dart';
import 'package:bank_app/utils/contacts/app_contacts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRepository{
  Future<NetworkResponse> insertUser(ProfileModel profileModel) async {
    bool IsExit=false;
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection(AppConstants.user).get();
    List<ProfileModel> users=querySnapshot.docs.map((e) => ProfileModel.fromJson(e.data() as Map<String,dynamic>)).toList();
    for(var user in users){
       if(profileModel.email==user.email){
         IsExit=true;
       }
    }
    if(IsExit==false){
      try {
        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection(AppConstants.user)
            .add(profileModel.toJson());

        await FirebaseFirestore.instance
            .collection(AppConstants.user)
            .doc(documentReference.id)
            .update({"userId": documentReference.id});
        return NetworkResponse(data: "success");
      } on FirebaseException catch (error) {
        return NetworkResponse(errorText: error.code);
      }
    }

    return NetworkResponse(errorText: "already register this email");
  }
  Future<NetworkResponse> updateUser(ProfileModel profileModel) async {
    try {
     await FirebaseFirestore.instance
          .collection(AppConstants.user)
          .doc(profileModel.userId).update(profileModel.toJsonforUpdate());

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.code);
    }
  }
  Future<NetworkResponse> deleteUser(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.user)
          .doc(docId).delete();

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.code);
    }
  }
  Future<NetworkResponse> getUserByDocId(String docId) async {
    try {
   DocumentSnapshot documentSnapshot= await FirebaseFirestore.instance
          .collection(AppConstants.user)
          .doc(docId).get();

      return NetworkResponse(data: documentSnapshot.data() as Map<String,dynamic>);
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.code);
    }
  }
  Future<NetworkResponse> getUserByDocUUId(String uuId) async {
    try {
     QuerySnapshot querySnapshot= await FirebaseFirestore.instance
          .collection(AppConstants.user)
          .where("authUUId",isEqualTo: uuId ).get();
     List<ProfileModel> users=querySnapshot.docs.map((e) => ProfileModel.fromJson(e as Map<String,dynamic>)).toList();
      return NetworkResponse(data: users.isEmpty ? ProfileModel.initial() : users[0] );
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.code);
    }
  }

}
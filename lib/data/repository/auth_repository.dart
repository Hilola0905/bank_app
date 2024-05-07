

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../network/firebase_auth_service.dart';
import '../network/response.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<NetworkResponse> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          data: "",
          errorText: "error : ${LogInWithEmailAndPasswordFailure.fromCode(e.code).message}");
    } catch(_){
      return NetworkResponse(
        errorText: "unKnown error"
      );
    }
  }
  Future<NetworkResponse> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          data: "",
          errorText: "error : ${SignUpWithEmailAndPasswordFailure
              .fromCode(e.code)
              .message}");
    } catch (_) {
      return NetworkResponse(
          errorText: "unKnown error"
      );
    }
  }
  Future<NetworkResponse> signOut() async {
    try{
      await _auth.signOut();
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          data: "",
          errorText: "error");
    } catch(_){
      return NetworkResponse(
          errorText: "unKnown error"
      );
    }
  }
  Future<NetworkResponse> signInWithGoogle() async {
    late AuthCredential credential;
    final googleUser= await GoogleSignIn().signIn();
    final googleAuth= await googleUser!.authentication;
    credential=GoogleAuthProvider.credential(
       accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          data: "",
          errorText: "error");
    } catch(_){
      return NetworkResponse(
          errorText: "unKnown error"
      );
    }
  }
}





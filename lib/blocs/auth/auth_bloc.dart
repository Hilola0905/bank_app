import 'package:bank_app/data/model/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/form_status.dart';
import '../../data/network/response.dart';
import '../../data/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc( {required AuthRepository authRepository}) :
        super(
       AuthState(errorMessage: "", formStatus: FormStatus.pure, statusMessage: "",
          profileModel: ProfileModel.initial(),
      )) {
    _authRepository=authRepository;
   on<RegisterEvent>(_register);
   on<CheckedInitialEvent>(_checkedAuth);
   on<LoginEvent>(_login);
   on<LogOutEvent>(_logOut);
   on<SignInGoogleEvent>(_signIn);
  }
  late final AuthRepository _authRepository;


  _checkedAuth(CheckedInitialEvent event,  emit ){
  User? user=FirebaseAuth.instance.currentUser;
  if(user!=null){
    emit(state.copyWidth(FormStatus.authenticated,"", "",ProfileModel.initial()));
  }
  else{
    emit(state.copyWidth(FormStatus.unauthenticated,"", "",ProfileModel.initial()));
  }
  }
  _login(LoginEvent event,  emit ) async {
    emit(state.copyWidth(FormStatus.loading,"","",ProfileModel.initial()));
    NetworkResponse networkResponse= await _authRepository.signInWithEmailPassword(
        event.email, event.password
    );
    if(networkResponse.errorText!.isEmpty){
      emit(state.copyWidth(FormStatus.authenticated, "", networkResponse.data.toString() ,ProfileModel.initial()));
    } else{
      emit(
        state.copyWidth(
            FormStatus.error, networkResponse.errorText, networkResponse.errorText,ProfileModel.initial())
      );
    }

  }
  _logOut(LogOutEvent event,  emit ) async {
    emit(state.copyWidth(FormStatus.loading,"","",ProfileModel.initial()));
    NetworkResponse networkResponse= await _authRepository.signOut();
    if(networkResponse.errorText!.isEmpty){
      emit(state.copyWidth(FormStatus.unauthenticated, "", networkResponse.data,ProfileModel.initial() ));
    } else{
      emit(
          state.copyWidth(
              FormStatus.error, networkResponse.errorText, networkResponse.errorText,ProfileModel.initial())
      );
    }
  }
  _signIn(SignInGoogleEvent event,  emit ) async {
    emit(state.copyWidth(FormStatus.loading,"","",ProfileModel.initial()));
    NetworkResponse networkResponse= await _authRepository.signInWithGoogle();
    if(networkResponse.errorText!.isEmpty){
      emit(state.copyWidth(FormStatus.authenticated, "", networkResponse.data.toString(),ProfileModel.initial() ));
    } else{
      emit(
          state.copyWidth(
              FormStatus.error, networkResponse.errorText, networkResponse.errorText,ProfileModel.initial())
      );
    }
  }
  _register(RegisterEvent event,  emit ) async {
    emit(state.copyWidth(FormStatus.loading,"","",event.profileModel));
    NetworkResponse networkResponse= await _authRepository.signUpWithEmailPassword(
        event.profileModel.email,
        event.profileModel.password
    );
    UserCredential userCredential=networkResponse.data as UserCredential;
    ProfileModel user=event.profileModel.copyWidth(
        authUUId: userCredential.user!.uid
    );
    if(networkResponse.errorText==""){
        emit(
          state.copyWidth(
              FormStatus.authenticated,
              "",
              networkResponse.data.toString(),
              user,
          )

      );
    } else{
      emit(
          state.copyWidth(
              FormStatus.error, networkResponse.errorText, networkResponse.errorText,event.profileModel)
      );
    }
  }

}

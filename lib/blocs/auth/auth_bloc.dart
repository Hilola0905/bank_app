import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/network/response.dart';
import '../../data/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      if(event.userModel.name == ''){
        emit(AuthErrorState("Siz isimni kiritmadingiz"));
      }
      else if(event.userModel.email.isEmpty){
        emit(AuthErrorState("Siz emailni kiritmadingiz"));
      }
      else if(event.confirmPassword == ''){
        emit(AuthErrorState("Parolni tasdiqlang"));
        return;
      }


      try {
        if (event.userModel.password == event.confirmPassword) {
          emit(AuthLoadState(isLoad: true));
          NetworkResponse networkResponse = await AuthRepository()
              .signUp(event.userModel.email, event.userModel.password);
          if (networkResponse.errorText == null) {
            emit(AuthSuccessState(networkResponse.data));
          } else {
            emit(AuthErrorState(networkResponse.errorText.toString()));
          }
        }
        else {
          emit(AuthErrorState("Sizning parolingiz mos kelmadi"));
          return;
        }

      } catch (e) {
        emit(AuthErrorState('$e'));
      }
    });

    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthLoadState(isLoad: true));
        NetworkResponse networkResponse =
        await AuthRepository().signIn(event.email, event.password);
        if (networkResponse.errorText == null) {
          emit(AuthSuccessState(networkResponse.data));
        } else {
          emit(AuthErrorState(networkResponse.errorText.toString()));
        }
      } catch (e) {
        emit(AuthErrorState('$e'));
      }
    });

    on<LogOutEvent>((event, emit) async {
      try {
        emit(AuthLoadState(isLoad: true));
        NetworkResponse networkResponse =
        await AuthRepository().logOut();
        if (networkResponse.errorText != null) {
          emit(AuthSuccessState(networkResponse.data));
        } else {
          emit(AuthErrorState(networkResponse.errorText.toString()));
        }
      } catch (e) {
        emit(AuthErrorState('$e'));
      }
    });
  }
}

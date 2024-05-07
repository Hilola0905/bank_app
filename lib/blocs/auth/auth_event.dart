
import 'package:bank_app/data/model/profile_model.dart';
import 'package:equatable/equatable.dart';


abstract class AuthEvent extends Equatable {}

class RegisterEvent extends AuthEvent{

  final ProfileModel profileModel;
  final String confirmPassword;
  RegisterEvent(this.profileModel, this.confirmPassword);

  @override
  List<Object?> get props => [
    profileModel.hashCode,
    confirmPassword.hashCode
  ];
}
class LoginEvent extends AuthEvent{

  final String email;
  final String password;
  LoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [
    email.hashCode,
    password.hashCode
  ];


}
class LogOutEvent extends AuthEvent{
  LogOutEvent();
  @override
  List<Object?> get props => [];


}
class CheckedInitialEvent extends AuthEvent{
  @override
  List<Object?> get props => [];
}

class SignInGoogleEvent extends AuthEvent{

  SignInGoogleEvent();

  @override
  List<Object?> get props => [];
}


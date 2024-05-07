
import 'package:bank_app/data/model/profile_model.dart';
import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UpdateProfileEvent extends ProfileEvent{
  final ProfileModel profileModel;
  UpdateProfileEvent({required this.profileModel});
}
class InitialProfileEvent extends ProfileEvent{
}
class AddProfileEvent extends ProfileEvent{
  final ProfileModel profileModel;
  AddProfileEvent({required this.profileModel});
}
class DeleteProfileEvent extends ProfileEvent{
  final ProfileModel profileModel;
  DeleteProfileEvent({required this.profileModel});
}
class GetProfileEvent extends ProfileEvent{
  final String uid;
  GetProfileEvent({required this.uid});
  @override
  // TODO: implement props
  List<Object?> get props => [uid];


}
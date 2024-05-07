import 'package:bank_app/data/model/profile_model.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/form_status.dart';


class ProfileState extends Equatable {

  final  FormStatus formStatus;
  final String errorMessage;
  final String statusMessage;
  final ProfileModel profileModel;
  const ProfileState({
    required this.errorMessage,
    required this.formStatus,
    required this.statusMessage,
    required this.profileModel
  });
  ProfileState copyWidth({
    FormStatus? formStatus,
    String? errorMessage,
    String? statusMessage,
    ProfileModel? profileModel,
  } ){
    return ProfileState(
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      profileModel: profileModel ?? this.profileModel,
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

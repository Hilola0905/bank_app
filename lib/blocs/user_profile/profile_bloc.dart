import 'package:bank_app/blocs/user_profile/profile_event.dart';
import 'package:bank_app/blocs/user_profile/profile_state.dart';
import 'package:bank_app/data/model/form_status.dart';
import 'package:bank_app/data/model/profile_model.dart';
import 'package:bank_app/data/network/response.dart';
import 'package:bank_app/data/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileBloc({required this.profileRepository}):super(ProfileState(
      errorMessage: "",
      formStatus: FormStatus.pure,
      statusMessage: "",
      profileModel: ProfileModel.initial()
  )){
    on<UpdateProfileEvent>(_update);
    on<AddProfileEvent>(_add);
    on<DeleteProfileEvent>(_delete);
    on<GetProfileEvent>(_get);
  }
  final ProfileRepository profileRepository;
  _update(UpdateProfileEvent event,  emit ) async {
    emit(state.copyWidth( formStatus:  FormStatus.loading));
    NetworkResponse networkResponse = await profileRepository.updateUser(event.profileModel);
    if(networkResponse.errorCode!.isNotEmpty){
      emit(
          state.copyWidth(
              formStatus: FormStatus.success,profileModel:  networkResponse.data as ProfileModel)
      );
    }else{
      emit(
          state.copyWidth(
              formStatus: FormStatus.error,errorMessage:  networkResponse.errorCode, )
      );
    }
  }
  _add(AddProfileEvent event,  emit )async {

    emit(state.copyWidth(formStatus:FormStatus.loading, ));
    NetworkResponse networkResponse = await profileRepository.insertUser(event.profileModel);
    if(networkResponse.errorCode!.isNotEmpty){
      emit(
        state.copyWidth(
            formStatus: FormStatus.success,profileModel: networkResponse.data as ProfileModel)
      );
    }else{
      emit(
          state.copyWidth(
              formStatus:FormStatus.error, errorMessage:  networkResponse.errorCode,)
      );
    }
  }
  _delete(DeleteProfileEvent event,  emit ) async {
    emit(state.copyWidth(formStatus:FormStatus.loading,));
    NetworkResponse networkResponse = await profileRepository.deleteUser(event.profileModel.userId);
    if(networkResponse.errorCode!.isNotEmpty){
      emit(
          state.copyWidth(
              formStatus: FormStatus.success,profileModel:networkResponse.data as ProfileModel)
      );
    }else{
      emit(
          state.copyWidth(
              formStatus:FormStatus.error,errorMessage:  networkResponse.errorCode, )
      );
    }
  }
  _get(GetProfileEvent event,  emit ) async {
    emit(state.copyWidth(formStatus:FormStatus.loading, ));
    NetworkResponse networkResponse = await profileRepository.getUserByDocUUId(
        event.uid);
    if(networkResponse.errorCode!.isNotEmpty){
      emit(
          state.copyWidth(
              formStatus: FormStatus.success,profileModel: networkResponse.data as ProfileModel)
      );
    }else{
      emit(
          state.copyWidth(
            formStatus:   FormStatus.error,)
      );
    }
  }
}
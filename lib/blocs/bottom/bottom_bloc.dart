import 'package:bank_app/blocs/bottom/bottom_event.dart';
import 'package:bank_app/blocs/bottom/bottom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBloc extends Bloc<BottomEvent,BottomState>{
  BottomBloc():super(const BottomState(index: 0)){
    on<BottomEvent>(_changeIndex);
  }
  _changeIndex(BottomEvent event,  emit ){
    emit(BottomState(index: event.index));
  }
}
import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/switch/switch_events.dart';
import 'package:bloc_st_mgmt/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDisableNotification>(_enableDisable);
  }
  void _enableDisable(
      EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitched: !state.isSwitched));
  }
}

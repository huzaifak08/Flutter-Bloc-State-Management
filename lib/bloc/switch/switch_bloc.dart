import 'package:bloc_statemanagement/bloc/switch/switch_event.dart';
import 'package:bloc_statemanagement/bloc/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDisableNotifications>(_toggleSwitch);
    on<SliderEvent>(_handleSlider);
  }

  void _toggleSwitch(
      EnableOrDisableNotifications event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _handleSlider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.sliderValue));
  }
}

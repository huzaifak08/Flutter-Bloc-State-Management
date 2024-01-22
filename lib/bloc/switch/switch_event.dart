import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotifications extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  final double sliderValue;
  const SliderEvent({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];
}

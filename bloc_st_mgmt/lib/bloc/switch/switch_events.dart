import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();
  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}

class SliderEvents extends SwitchEvents {
  final double slider;
  const SliderEvents({required this.slider});
  @override
  List<Object?> get props => [slider];
}

import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitched;
  final double slider;
  const SwitchState({this.isSwitched = true, this.slider = 0.7});

  SwitchState copyWith({bool? isSwitched, double? slider}) {
    return SwitchState(
      isSwitched: isSwitched ?? this.isSwitched,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object?> get props => [isSwitched, slider];
}

import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();
  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}

//class DisableNotification extends SwitchEvents {}

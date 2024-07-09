import 'package:equatable/equatable.dart';

abstract class CounterEvents extends Equatable {
  const CounterEvents();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvents {}

class DecrementConuter extends CounterEvents {}

import 'package:equatable/equatable.dart';

abstract class PostEvents extends Equatable {
  const PostEvents();

  @override
  List<Object?> get props => [];
}

class FetchPost extends PostEvents {}

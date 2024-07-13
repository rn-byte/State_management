import 'package:equatable/equatable.dart';

abstract class PostEvents extends Equatable {
  const PostEvents();

  @override
  List<Object?> get props => [];
}

class FetchPost extends PostEvents {}

class SearchPost extends PostEvents {
  final String stSearch;
  const SearchPost({required this.stSearch});

  @override
  List<Object?> get props => [stSearch];
}

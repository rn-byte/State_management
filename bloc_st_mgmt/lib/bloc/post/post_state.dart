import 'package:bloc_st_mgmt/utils/enum/enums.dart';
import 'package:equatable/equatable.dart';

import '../../models/post_model/post_model.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String stMessage;
  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
    this.stMessage = '',
  });

  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    List<PostModel>? tempPostList,
    String? message,
    String? stMessage,
  }) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      tempPostList: tempPostList ?? this.tempPostList,
      message: message ?? this.message,
      stMessage: stMessage ?? this.stMessage,
    );
  }

  @override
  List<Object?> get props =>
      [postStatus, postList, tempPostList, message, stMessage];
}

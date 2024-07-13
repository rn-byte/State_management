import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/post/post_events.dart';
import 'package:bloc_st_mgmt/bloc/post/post_state.dart';
import 'package:bloc_st_mgmt/repository/post_repository.dart';
import 'package:bloc_st_mgmt/utils/enum/enums.dart';

import '../../models/post_model/post_model.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  List<PostModel> tempPostList = [];

  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<FetchPost>(fetchPost);
    on<SearchPost>(_filterList);
  }
  void fetchPost(FetchPost event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'Success',
        postList: value,
      ));
    }).onError((error, staceTrace) {
      // print(error);
      // print(staceTrace);
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }

  void _filterList(SearchPost event, Emitter<PostState> emit) {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempPostList: [], stMessage: ''));
    } else {
      // tempPostList = state.postList
      //     .where((element) =>
      //         element.email.toString() == event.stSearch.toString())
      //     .toList();
      tempPostList = state.postList
          .where((element) => element.email
              .toString()
              .toLowerCase()
              .contains(event.stSearch.toString().toLowerCase()))
          .toList();
      if (tempPostList.isEmpty) {
        emit(state.copyWith(
            tempPostList: tempPostList, stMessage: 'No Data Found !'));
      } else {
        emit(state.copyWith(tempPostList: tempPostList, stMessage: ''));
      }
    }
  }
}

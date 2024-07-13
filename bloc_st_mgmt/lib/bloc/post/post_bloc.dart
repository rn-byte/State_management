import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/post/post_events.dart';
import 'package:bloc_st_mgmt/bloc/post/post_state.dart';
import 'package:bloc_st_mgmt/repository/post_repository.dart';
import 'package:bloc_st_mgmt/utils/enum/enums.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<FetchPost>(fetchPost);
  }
  void fetchPost(FetchPost event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.compyWith(
        postStatus: PostStatus.success,
        message: 'Success',
        postList: value,
      ));
    }).onError((error, staceTrace) {
      // print(error);
      // print(staceTrace);
      emit(state.compyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }
}

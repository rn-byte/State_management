import 'package:blc_st_mgmt_clean_archit/bloc/movies/movies_event.dart';
import 'package:blc_st_mgmt_clean_archit/bloc/movies/movies_states.dart';
import 'package:blc_st_mgmt_clean_archit/data/response/api_response.dart';
import 'package:blc_st_mgmt_clean_archit/repository/movies_repo/movies_repository.dart';
import 'package:bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  MoviesRepository moviesRepository;

  MoviesBloc({required this.moviesRepository})
      : super(MoviesStates(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(
      MoviesFetched event, Emitter<MoviesStates> emit) async {
    await moviesRepository.fetchMoviesList().then((value) {
      emit(state.copyWith(moviesList: ApiResponse.completed(value)));
    }).onError((error, stackTrace) {
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
    });
  }
}

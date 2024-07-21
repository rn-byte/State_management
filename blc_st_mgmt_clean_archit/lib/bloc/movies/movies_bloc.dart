import 'package:blc_st_mgmt_clean_archit/bloc/movies/movies_event.dart';
import 'package:blc_st_mgmt_clean_archit/bloc/movies/movies_states.dart';
import 'package:blc_st_mgmt_clean_archit/data/response/api_response.dart';
import 'package:bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  MoviesBloc() : super(MoviesStates(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(_onMoviesFetched);
  }

  void _onMoviesFetched(MoviesFetched event, Emitter<MoviesStates> emit) {
    emit(state.copyWith());
  }
}

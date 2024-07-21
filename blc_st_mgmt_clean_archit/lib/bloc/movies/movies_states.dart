import 'package:blc_st_mgmt_clean_archit/data/response/api_response.dart';
import 'package:equatable/equatable.dart';

import '../../models/movies/movies.dart';

class MoviesStates extends Equatable {
  final ApiResponse<MoviesModel> moviesList;

  const MoviesStates({required this.moviesList});

  MoviesStates copyWith({ApiResponse<MoviesModel>? moviesList}) {
    return MoviesStates(
      moviesList: moviesList ?? this.moviesList,
    );
  }

  @override
  List<Object?> get props => [moviesList];
}

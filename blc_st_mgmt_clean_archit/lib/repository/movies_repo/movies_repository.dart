import 'package:blc_st_mgmt_clean_archit/models/movies/movies.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMoviesList();
}

import 'package:blc_st_mgmt_clean_archit/config/app_url.dart';
import 'package:blc_st_mgmt_clean_archit/data/network/network_api_services.dart';
import 'package:blc_st_mgmt_clean_archit/models/movies/movies.dart';
import 'package:blc_st_mgmt_clean_archit/repository/movies_repo/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository {
  final _apiService = NetworkApiServices();
  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiService
        .getApi(AppUrl.moviesUrlEndpoint)
        .timeout(const Duration(seconds: 10));

    return MoviesModel.fromJson(response);
  }
}

import 'package:blc_st_mgmt_clean_archit/bloc/movies/movies_bloc.dart';
import 'package:blc_st_mgmt_clean_archit/bloc/movies/movies_event.dart';
import 'package:blc_st_mgmt_clean_archit/bloc/movies/movies_states.dart';
import 'package:blc_st_mgmt_clean_archit/config/components/internet_exception_widget.dart';
import 'package:blc_st_mgmt_clean_archit/config/components/loading_widget.dart';
import 'package:blc_st_mgmt_clean_archit/config/routes/routes_name.dart';
import 'package:blc_st_mgmt_clean_archit/main.dart';
import 'package:blc_st_mgmt_clean_archit/services/storage/local_storage.dart';
import 'package:blc_st_mgmt_clean_archit/utils/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;
  @override
  void initState() {
    moviesBloc = MoviesBloc(moviesRepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue('token').then((value) {
                localStorage.clearValue('isLogin');
                Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesStates>(
          builder: (context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return const LoadingWidget();
              case Status.error:
                debugPrint(state.moviesList.message.toString());
                if (state.moviesList.message.toString() ==
                    'No Internet Connection') {
                  return InternetExceptionWidget(
                    onPress: () {
                      moviesBloc.add(MoviesFetched());
                    },
                  );
                }
                return Center(child: Text(state.moviesList.message.toString()));
              case Status.success:
                if (state.moviesList.data == null) {
                  return const Center(child: Text('No data Found!!!'));
                }
                final moviesList = state.moviesList.data!;
                return ListView.builder(
                  itemCount: moviesList.tvShows.length,
                  itemBuilder: (context, index) {
                    final tvShow = moviesList.tvShows[index];
                    return Card(
                      child: ListTile(
                        leading:
                            Image.network(tvShow.imageThumbnailPath.toString()),
                        title: Text(tvShow.name),
                        subtitle: Text(tvShow.network),
                        trailing: Text(tvShow.status),
                      ),
                    );
                  },
                );
              default:
                return const Center(
                  child: SizedBox(
                    child: Center(child: Text('Something Went Wrong !')),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

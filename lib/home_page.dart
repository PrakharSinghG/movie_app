import 'package:flutter/material.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '81a3a015260553100666d85edfc15522';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MWEzYTAxNTI2MDU1MzEwMDY2NmQ4NWVkZmMxNTUyMiIsIm5iZiI6MTcyMjc5OTI2My42NjY2MjgsInN1YiI6IjY2YWZkMzZhM2YxNjAyOTUyNjkwZTMxNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0bCeKHfPIuImrihxiQstXqvagiW_Z3YRC6zGU3iUz58';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text('Movie App ❤️'),
      ),
      body: ListView(
        children: [
          TopRated(
            toprated: topratedmovies,
          ),
          TrendingMovies(
            trending: trendingmovies,
          ),
          TV(
            tv: tv,
          ),
        ],
      ),
    );
  }
}

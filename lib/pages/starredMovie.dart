import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/widgets/movie.dart';

class StarredMovie extends StatefulWidget {
  const StarredMovie({Key? key}) : super(key: key);

  @override
  State<StarredMovie> createState() => _StarredMovieState();
}

class _StarredMovieState extends State<StarredMovie> {
  List<MovieW> movieList = [];
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future<void> getMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed');
    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body)['results'];
      print(responseData);
      List<MovieW> movies = [];
      responseData.forEach((value) {
        movies.add(MovieW(
            id: value['id'],
            originallanguage: value['original_title'],
            overview: value['overview'],
            title: value['title'],
            voteaverage: value['vote_average'],
            votecount: value['vote_count'],
            posterpath: value['poster_path']));
      });
      setState(() {
        movieList = movies;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => getMovies(),
      child: ListView(
        children: movieList,
      ),
    );
  }
}

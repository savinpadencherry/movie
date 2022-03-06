import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/services/getmovies.dart';
import 'package:movies/widgets/movie.dart';
import 'package:provider/provider.dart';

class Movie extends StatefulWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  List<MovieW> movieList = [];

  @override
  void initState() {
    super.initState();
    getMoview();
  }

  Future<void> getMoview() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed');
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
      onRefresh: () => getMoview(),
      child: ListView(
        children: movieList,
      ),
    );
  }
}

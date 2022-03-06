import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/widgets/movie.dart';

class Get with ChangeNotifier {
  final List<MovieW> _movies = [];

  List<MovieW> get moviesWidgets {
    return _movies;
  }

  Future<void> getMoview() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed');
    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body)['results'];
      print(responseData);
      responseData.forEach((value) {
        _movies.add(MovieW(
            id: value['id'],
            originallanguage: value['original_title'],
            overview: value['overview'],
            title: value['title'],
            voteaverage: value['vote_average'],
            votecount: value['vote_count'],
            posterpath: value['poster_path']));
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed');
    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body)['results'];
      print(responseData);
      responseData.forEach((value) {
        _movies.add(MovieW(
            id: value['id'],
            originallanguage: value['original_title'],
            overview: value['overview'],
            title: value['title'],
            voteaverage: value['vote_average'],
            votecount: value['vote_count'],
            posterpath: value['poster_path']));
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}

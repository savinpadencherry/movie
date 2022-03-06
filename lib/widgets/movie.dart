import 'dart:core';

import 'package:flutter/material.dart';
import 'package:movies/widgets/description.dart';

class MovieW extends StatefulWidget {
  var id;
  final String? originallanguage;
  final String? overview;
  final String? title;
  var votecount;
  var voteaverage;
  final String? posterpath;
  MovieW({
    Key? key,
    this.id,
    this.originallanguage,
    this.overview,
    this.title,
    this.voteaverage,
    this.posterpath,
    this.votecount,
  }) : super(key: key);

  factory MovieW.fromJson(Map<String, dynamic> json) {
    return MovieW(
      id: json['id'],
      originallanguage: json['original_title'],
      overview: json['overview'],
      posterpath: json['poster_path'],
      title: json['title'],
      voteaverage: json['vote_average'],
      votecount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'original_title': originallanguage,
        'overview': overview,
        'poster_path': posterpath,
        'title': title,
        'vote_average': voteaverage,
        'vote_count': votecount,
      };

  @override
  State<MovieW> createState() => _MovieWState();
}

class _MovieWState extends State<MovieW> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Description(
            title: widget.title,
            description: widget.overview,
            image: widget.posterpath,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Colors.deepOrange
                // Colors.yellow,
              ],
              stops: [0.6, 0.8],
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(4, 4)),
            ],
          ),
          child: Column(children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/movies.jpg'),
              ),
              title: Text(
                widget.title!.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                widget.overview!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

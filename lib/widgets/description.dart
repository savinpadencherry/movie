import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String? description;
  final String? title;
  final String? image;
  const Description({Key? key, this.description, this.image, this.title})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          Positioned(
            bottom: 30,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    widget.description!,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/movies.jpg'),
          ),
        ],
      ),
    );
  }
}

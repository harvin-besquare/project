// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    Key? key,
    required this.title,
    required this.description,
    required this.url,
    required this.name,
  }) : super(key: key);

  final String title;
  final String description;
  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: ListView(
        children: [
          Column(
            children: [
                Image(
                  image: NetworkImage(Uri.parse(url).isAbsolute
                      ? url
                      : 'https://www.freeiconspng.com/uploads/no-image-icon-6.png'),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20.0),
                child: Flexible(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

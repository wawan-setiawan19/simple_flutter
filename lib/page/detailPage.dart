import 'package:flutter/material.dart';
import 'package:simple_apps/model.dart';

class DetailPage extends StatelessWidget {
  // DetailPage({Key? key, required Posts posts}) : super(key: key);

  final Posts posts;
  const DetailPage({Key? key, required this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://image.tmdb.org/t/p/w500${posts.picture}'),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  posts.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(posts.body),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_apps/model.dart';
import 'package:simple_apps/page/detailPage.dart';


class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.posts}) : super(key: key);
  final Posts posts;

  // const PostCard({required this.posts});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DetailPage(posts: posts);
            }),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: AlignmentDirectional.topStart,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://image.tmdb.org/t/p/w500${posts.picture}'),
            Text(
              posts.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:simple_apps/model.dart';
import 'package:simple_apps/widget/postCard.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Posts>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=222e6532a1c40df943028811b533a90d'));

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body);
      List result = getPostsData['results'];
      var listPosts = result.map((i) => Posts.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  late Future<List<Posts>> futurePosts;

  @override
  void initState() {
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: FutureBuilder<List<Posts>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        var post = (snapshot.data as List<Posts>)[index];
                        return Column(
                          children: [
                            PostCard(
                              posts: Posts(
                                  id: post.id,
                                  title: post.title,
                                  body: post.body,
                                  picture: post.picture,
                                  ),
                            ),
                            const SizedBox(height: 20)
                          ],
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: (snapshot.data as List<Posts>).length);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'package:flutter_app/views/widgets/container_widget.dart';
import 'package:flutter_app/data/classes/post_class.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
      var response = await http.get(Uri.https('dummyjson.com', '/posts', {'limit': '5'}));
      if (!mounted) return [];
      
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        var postsList = (jsonResponse['posts'] as List<dynamic>)
            .map((post) => Post.fromJson(post as Map<String, dynamic>))
            .toList();
        return postsList;
      } else {
        throw Exception('Failed to load posts');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Course'), centerTitle: true),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts available'));
          }
          
          final postsList = snapshot.data!;
          
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  HeroWidget(title: 'Flutter Course'),
                  SizedBox(height: 10.0),
                  ...List.generate(
                    postsList.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: ContainerWidget(
                        title: postsList[index].title,
                        description: postsList[index].body,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

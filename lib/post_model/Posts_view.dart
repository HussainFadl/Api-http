import 'package:api_training/post_model/api_services.dart';
import 'package:api_training/post_model/post_model.dart';
import 'package:flutter/material.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Service with FutureBuilder'),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Center(
        child: FutureBuilder(
            future: ApiServices.getPosts(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      PostModel posts = snapshot.data![index];
                      return ListTile(
                        leading: Text(posts.id.toString()),
                        title: Text(posts.title.toString()),
                        subtitle: Text(posts.body.toString()),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: snapshot.data!.length);
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const CircularProgressIndicator();
              }
            })),
      ),
    );
  }
}

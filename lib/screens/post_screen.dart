import 'package:bloc_statemanagement/bloc/post/post_bloc.dart';
import 'package:bloc_statemanagement/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts App for API')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const CircularProgressIndicator();

            case PostStatus.failure:
              return Text(state.message);

            case PostStatus.success:
              return Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search by email'),
                    onChanged: (value) {
                      context
                          .read<PostBloc>()
                          .add(SearchPost(seachStr: value.trim()));
                    },
                  ),
                  Expanded(
                      child: state.searchMessage.isNotEmpty
                          ? Text(state.searchMessage.toString())
                          : ListView.builder(
                              itemCount: state.tempSearchList.isEmpty
                                  ? state.postList.length
                                  : state.tempSearchList.length,
                              itemBuilder: (context, index) {
                                if (state.tempSearchList.isEmpty) {
                                  PostModel post = state.postList[index];

                                  return ListTile(
                                    title: Text(post.email),
                                    subtitle: Text(post.name),
                                  );
                                } else {
                                  PostModel searchedPost =
                                      state.tempSearchList[index];

                                  return ListTile(
                                    title: Text(searchedPost.email),
                                    subtitle: Text(searchedPost.name),
                                  );
                                }
                              },
                            )),
                ],
              );

            default:
              return const Text('Please check your connections');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostBloc>().add(FetchPosts());
        },
      ),
    );
  }
}

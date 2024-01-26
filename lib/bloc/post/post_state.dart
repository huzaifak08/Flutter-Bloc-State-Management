part of 'post_bloc.dart';

// Create a seperate file for enums in utils folder in future (ISA)
enum PostStatus { loading, success, failure }

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempSearchList;
  final String message;
  final String searchMessage;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempSearchList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    List<PostModel>? tempSearchList,
    String? message,
    String? searchMessage,
  }) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      tempSearchList: tempSearchList ?? this.tempSearchList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props =>
      [postStatus, postList, tempSearchList, message, searchMessage];
}

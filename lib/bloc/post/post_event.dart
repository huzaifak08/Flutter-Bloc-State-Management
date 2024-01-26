part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchPosts extends PostEvent {}

class SearchPost extends PostEvent {
  final String seachStr;
  const SearchPost({required this.seachStr});

  @override
  List<Object> get props => [seachStr];
}

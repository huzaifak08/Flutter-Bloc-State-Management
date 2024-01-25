import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/models/post_model.dart';
import 'package:bloc_statemanagement/repository/post_repo.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository = PostRepository();
  // List<PostModel> _postList = []; // Method 1

  PostBloc() : super(const PostState()) {
    on<FetchPosts>(_fetchPosts);
  }

  void _fetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    /* Method 1:
    _postList = await _postRepository.fetchPosts();
    emit(state.copyWith(
        postList: List.from(_postList),
        postStatus: PostStatus.success,
        message: 'Success'));
     */

    await _postRepository.fetchPosts().then((value) {
      emit(state.copyWith(
        postList: value, // fetchPosts return List<PostModel>
        postStatus: PostStatus.success,
        message: 'Success',
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }
}

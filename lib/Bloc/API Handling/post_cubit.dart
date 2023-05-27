import 'package:bloc_statemanagement/Bloc/API%20Handling/post_model.dart';
import 'package:bloc_statemanagement/Bloc/API%20Handling/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitialState()) {
    // call this method here:
    // This will work as init state:
    fetchPost();
  }

  PostRepo postRepo = PostRepo();

  void fetchPost() async {
    emit(PostLoadingState());

    try {
      List<PostModel> posts = await postRepo.fetchPost();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}

// States:
abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> postList;
  PostLoadedState(this.postList);
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}

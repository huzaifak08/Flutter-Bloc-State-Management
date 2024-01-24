import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/models/favourite_model.dart';
import 'package:bloc_statemanagement/repository/favourite_repo.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteState()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavoriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemsList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavoriteItem(FavouriteItem event, Emitter<FavouriteState> emit) {
    // Get index from the list.

    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);

    // Must see Lec 9 Bloc from 50:00 in case of error:
    // Update the list with item which was added to favourite.

    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemsList: List.from(favouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteState> emit) {
    tempFavouriteList.add(event.item);

    emit(state.copyWith(tempFavList: List.from(tempFavouriteList)));
  }

  void _unSelectItem(UnSelectItem event, Emitter<FavouriteState> emit) {
    tempFavouriteList.remove(event.item);

    emit(state.copyWith(tempFavList: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteState> emit) {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();

    emit(state.copyWith(
      favouriteItemsList: List.from(favouriteList),
      tempFavList: List.from(tempFavouriteList),
    ));
  }
}

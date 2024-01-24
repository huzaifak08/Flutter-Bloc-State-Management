part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteItemsList;
  final List<FavouriteItemModel> tempFavList;
  final ListStatus listStatus;

  const FavouriteState({
    this.favouriteItemsList = const [],
    this.tempFavList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteState copyWith({
    List<FavouriteItemModel>? favouriteItemsList,
    List<FavouriteItemModel>? tempFavList,
    ListStatus? listStatus,
  }) {
    return FavouriteState(
        favouriteItemsList: favouriteItemsList ?? this.favouriteItemsList,
        tempFavList: tempFavList ?? this.tempFavList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [favouriteItemsList, tempFavList, listStatus];
}

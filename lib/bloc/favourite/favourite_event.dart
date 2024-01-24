part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  final FavouriteItemModel item;
  const FavouriteItem({required this.item});

  @override
  List<Object> get props => [item];
}

class SelectItem extends FavouriteEvent {
  final FavouriteItemModel item;
  const SelectItem({required this.item});

  @override
  List<Object> get props => [item];
}

class UnSelectItem extends FavouriteEvent {
  final FavouriteItemModel item;
  const UnSelectItem({required this.item});

  @override
  List<Object> get props => [item];
}

class DeleteItem extends FavouriteEvent {}

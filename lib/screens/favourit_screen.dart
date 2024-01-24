import 'package:bloc_statemanagement/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_statemanagement/models/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavList.isEmpty ? false : true,
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteItem());
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          List<FavouriteItemModel> favList = state.favouriteItemsList;

          switch (state.listStatus) {
            case ListStatus.loading:
              return const CircularProgressIndicator();

            case ListStatus.failure:
              return const Text('Error Occoured');

            case ListStatus.success:
              return ListView.builder(
                itemCount: favList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: state.tempFavList.contains(favList[index])
                          ? true
                          : false,
                      onChanged: (value) {
                        if (value!) {
                          context
                              .read<FavouriteBloc>()
                              .add(SelectItem(item: favList[index]));
                        } else {
                          context
                              .read<FavouriteBloc>()
                              .add(UnSelectItem(item: favList[index]));
                        }
                      },
                    ),
                    title: Text(favList[index].value),
                    trailing: IconButton(
                      icon: Icon(favList[index].isFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline),
                      onPressed: () {
                        // Don't tease the existing list. Make new Object for that item and add it to fav.

                        FavouriteItemModel favouriteItem = FavouriteItemModel(
                            id: favList[index].id,
                            value: favList[index].value,
                            isFavourite:
                                favList[index].isFavourite ? false : true);

                        context
                            .read<FavouriteBloc>()
                            .add(FavouriteItem(item: favouriteItem));
                      },
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}

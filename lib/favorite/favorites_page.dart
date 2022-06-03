import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/favorite/favorite_item.dart';
import 'package:proto/favorite/favorite_model.dart';
import 'package:proto/helpers/api/predictions.dart';
import 'package:proto/prediction_form/model/pc.model.dart';

class FavoritesPage extends HookWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: FavoritesPage());
  @override
  Widget build(BuildContext context) {
    //this is the values to be displayed
    final futuerFavorite =
        useState<dynamic>(const Favorite(pc: PcInfo(), price: 0.0, id: -1));
    final user = context.select((AppBloc bloc) => bloc.state.user);

    //we put the function into aseMemo to
    final future = useMemoized(() async {
      return FavoriteApi.fetchFavorite(user.token);
    });
    final snapshot = useFuture(future, initialData: null);
    useEffect(
      () {
        if (snapshot.data != null) {
          futuerFavorite.value = snapshot.data.toList();
        }
      },
    );
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: futuerFavorite.value ==
              const Favorite(pc: PcInfo(), price: 0.0, id: -1)
          ? const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()))
          //? Text("بالاستغفا")
          : ListView.separated(
              itemCount: futuerFavorite.value.length,
              separatorBuilder: (BuildContext context, index) {
                return const Divider(height: 3);
              },
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: const Icon(Icons.delete_forever,
                            color: Colors.white, size: 50)),
                    key: Key(index.toString()),
                    onDismissed: (direction) async {
                      await FavoriteApi.deleteFavorite(
                          futuerFavorite.value[index].id, user.token);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "this Prediction was removerd from your favorite")));
                    },
                    child: FavoriteItem(favorite: futuerFavorite.value[index]));
              }),
    );
  }
}

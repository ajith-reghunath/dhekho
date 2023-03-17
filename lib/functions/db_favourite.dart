import 'package:dhekho_app/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<FavouriteModel>> favouriteListNotifier = ValueNotifier([]);

Future<void> addToFavourite(FavouriteModel value) async {
  final favouriteDB = await Hive.openBox<FavouriteModel>('favourite_db');
  await favouriteDB.add(value);
}

Future<void> getAllFavourites() async {
  final favouriteDB = await Hive.openBox<FavouriteModel>('favourite_db');
  // await favouriteDB.clear();
  favouriteListNotifier.value.clear();
  favouriteListNotifier.value.addAll(favouriteDB.values);
  favouriteListNotifier.notifyListeners();
}

Future<void> deleteFromFavourites(int id2) async {
  final favouriteDB = await Hive.openBox<FavouriteModel>('favourite_db');
  final index =
      favouriteDB.values.toList().indexWhere((element) => element.id == id2);
  await favouriteDB.deleteAt(index);
  await getAllFavourites();
}

Future<void> deleteFromFavouritesUsingPath(String path) async {
  final favouriteDB = await Hive.openBox<FavouriteModel>('favourite_db');
  final index =
      favouriteDB.values.toList().indexWhere((element) => element.path == path);
  await favouriteDB.deleteAt(index);
  await getAllFavourites();
}

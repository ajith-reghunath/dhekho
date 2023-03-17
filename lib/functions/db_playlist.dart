import 'package:dhekho_app/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<PlaylistModel>> playlistNotifier = ValueNotifier([]);

Future<void> addPlaylist(PlaylistModel value) async {
  final playlistDB = await Hive.openBox<PlaylistModel>('playlist_db');
  // playlistDB.clear();
  final id = await playlistDB.add(value);
  value.playlistId = id;
  playlistDB.put(id, value);
  await getAllPlaylist();
}

Future<void> getAllPlaylist() async {
  final playlistDB = await Hive.openBox<PlaylistModel>('playlist_db');
  playlistNotifier.value.clear();
  playlistNotifier.value.addAll(playlistDB.values);
  playlistNotifier.notifyListeners();
}

Future<void> deletePlaylist(int id) async {
  final playlistDB = await Hive.openBox<PlaylistModel>('playlist_db');
  PlaylistModel playlist =
      playlistDB.values.firstWhere((playlist) => playlist.playlistId == id);
  playlistDB.delete(playlist.playlistId);
  await getAllPlaylist();
}

Future<void> updatePlaylist(PlaylistModel value) async {
  final playlistDB = await Hive.openBox<PlaylistModel>('playlist_db');
  // print(value.id);
  // print(value.name);
  playlistDB.put(value.playlistId, value);
  await getAllPlaylist();
}



import 'package:dhekho_app/model/data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<PlaylistVideoModel>> playlistVideoNotifier =
    ValueNotifier([]);

Future<void> addtoPlaylist(PlaylistVideoModel value) async {
  final playlistVideoDB =
      await Hive.openBox<PlaylistVideoModel>('playlistvideo_db');
  final id = await playlistVideoDB.add(value);
  value.id = id;
  playlistVideoDB.put(id, value);
}

Future<void> getAllPlaylistVideo() async {
  final playlistVideoDB =
      await Hive.openBox<PlaylistVideoModel>('playlistvideo_db');
  playlistVideoNotifier.value.clear();
  playlistVideoNotifier.value.addAll(playlistVideoDB.values);
  playlistVideoNotifier.notifyListeners();
}

Future<void> deleteFromPlaylist(int id) async {
  final playlistVideoDB =
      await Hive.openBox<PlaylistVideoModel>('playlistvideo_db');
  PlaylistVideoModel playlistvideo = playlistVideoDB.values
      .firstWhere((playlistvideo) => playlistvideo.id == id);
  playlistVideoDB.delete(playlistvideo.id);
  await getAllPlaylistVideo();
}

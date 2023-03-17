import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dhekho_app/Screens/playing_screen.dart';
import 'package:dhekho_app/bottom_nav.dart';
import 'package:dhekho_app/functions/db_function.dart';
import 'package:dhekho_app/model/data_model.dart';
import 'package:fetch_all_videos/fetch_all_videos.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    notifylisteners();
    super.initState();
  }

  notifylisteners() async {
    await getVideos();
    getAllVideos();
  }

  getVideos() async {
    await checkVideo();
    // await deleteDatabase();
    FetchAllVideos ob = FetchAllVideos();
    videos = await ob.getAllVideos();
    for (var i = 0; i < videos.length; i++) {
      String path = videos[i];
      final video = VideoModel(path: path);
      addVideo(video);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Text(
        'DHEKHO',
        style: TextStyle(
            fontSize: 30,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
      nextScreen: const BottomNav(),
      backgroundColor: const Color(0xFF362360),
      duration: 3000,
    );
  }
}

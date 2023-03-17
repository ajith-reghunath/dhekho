import 'dart:io';
import 'package:dhekho_app/Screens/video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

List videos = [];
// ignore: prefer_typing_uninitialized_variables
var pathvideo;

class PlayingScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final videopath;
  const PlayingScreen({super.key, required this.videopath});

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  @override
  Widget build(BuildContext context) {
    pathvideo = widget.videopath;
    final videoplayerWidget = VideoPlayerWidget(
        videoplayercontroller: VideoPlayerController.file(File(pathvideo)));
    var title = pathvideo.toString().split("/").last;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: FittedBox(
          child: Stack(
            children: [
              videoplayerWidget,
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) {
                        //   return const BottomNav();
                        // }));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              )
            ],
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [IconButton(onPressed: (() {

          //   }), icon: Icon(Icons.arrow_back_ios)),videoplayerWidget],
          // ),
        ),
      ),
    );
  }
}

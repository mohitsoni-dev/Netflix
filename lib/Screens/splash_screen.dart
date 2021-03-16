import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplScreen extends StatefulWidget {
  final Widget navigateAfterSplashScreen;
  SplScreen({@required this.navigateAfterSplashScreen});

  @override
  _SplScreenState createState() => _SplScreenState();
}

class _SplScreenState extends State<SplScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/splash_screen.mp4')
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
    Timer(
        Duration(seconds: 4, milliseconds: 500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => widget.navigateAfterSplashScreen)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: SizedBox(
          width: _controller.value.size?.width ?? 0,
          height: _controller.value.size?.height ?? 0,
          child: VideoPlayer(_controller),
        ),
      ),
    );

    // return SplashScreen(
    //   seconds: 4,
    //   navigateAfterSeconds: widget.navigateAfterSplashScreen,
    //
    //   //title: Text('WELCOME TO NETFLIX'),
    //   // image: Image.asset('assets/logo.png'),
    //   backgroundColor: Colors.black,
    //   // photoSize: 100.0,
    //
    //   //loaderColor: Colors.red,
    // );
  }
}

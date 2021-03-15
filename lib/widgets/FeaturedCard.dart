import "package:flutter/material.dart";
import 'package:netflix/widgets/transparent_button_widget.dart';

class FeaturedCard extends StatelessWidget {
  final String content;

  FeaturedCard({this.content});

  @override
  Widget build(BuildContext context) {
    double height = 550;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/$content.jpg"),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          child: SizedBox(
            child: Image.asset("assets/${content}logo.png"),
            width: 250.0,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TransparentButton(
                  icon: Icon(
                    Icons.add_rounded,
                    size: 30,
                  ),
                  title: "My List",
                  //TODO: Add this featured content to my list
                  onTap: () => print("Added to my list")),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black87),
                ),
                //TODO: Play the featured Content
                onPressed: () => print('PLay'),
                child: Row(children: [
                  Icon(Icons.play_arrow_rounded),
                  Text(
                    "Play",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]),
              ),
              TransparentButton(
                  icon: Icon(
                    Icons.info_outline,
                  ),
                  title: "Info",
                  //TODO: Show Bottom sheet when tapped
                  onTap: () => print("INFO")),
            ],
          ),
        )
      ],
    );
  }
}

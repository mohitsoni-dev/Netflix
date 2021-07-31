import 'package:flutter/material.dart';
import 'package:netflix/Screens/content_page.dart';

class ItemCard extends StatelessWidget {
  final bool myList;
  final String content;

  ItemCard({@required this.myList, @required this.content});

  @override
  Widget build(BuildContext context) {
    const height = 160.0;
    const width = 100.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ContentDetail(content: content)),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage("assets/$content.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              height: 30,
              width: 60,
              child: Image.asset("assets/${content}logo.png"),
            ),
          ),
          //myList == false ? null : Container(),
        ],
      ),
    );
  }
}

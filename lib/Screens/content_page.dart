import 'package:flutter/material.dart';

class ContentDetail extends StatelessWidget {
  final String content;
  const ContentDetail({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x00000000),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/$content.jpg',
                  // height: 400,
                  // fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 16.0,
                bottom: 20.0,
                child: new FloatingActionButton(
                  child: const Icon(
                    Icons.play_arrow,
                    size: 36.0,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 10.0),
                  CustomTags(label: '18+'),
                  SizedBox(width: 10.0),
                  CustomTags(label: 'Vampire'),
                  SizedBox(width: 10.0),
                  CustomTags(label: '4.7', iconData: Icons.star),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomTags extends StatelessWidget {
  final String label;
  final IconData iconData;
  const CustomTags({Key key, this.label, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: new BoxDecoration(
        color: Colors.grey.withOpacity(0.75),
        border: Border.all(color: Colors.grey.withOpacity(0.75)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          iconData != null
              ? Icon(iconData, color: Colors.yellow, size: 16.0)
              : Container(),
          iconData != null ? SizedBox(width: 8.0) : Container(),
          Text(label),
        ],
      ),
    );
  }
}

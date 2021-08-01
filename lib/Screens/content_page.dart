import 'package:flutter/material.dart';
import 'package:netflix/Screens/video_screen.dart';
import 'package:video_player/video_player.dart';

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlay(
                          looping: false,
                          autoplay: true,
                          videoPlayerController: VideoPlayerController.network(
                              'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
                        ),
                      ),
                    );
                  },
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
                    icon: Icon(Icons.download, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined, color: Colors.white),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JoJo\'s Bizzare Adventures',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                    'Multiple generations of the Joestar family -- all with the same nickname -- confront supernatural villians through a series of time periods.'),
                SizedBox(height: 4.0),
                Text(
                  'Cast: Daiki Yamashita, Wataru Takagi, Kensho Ono',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LargeIconButton(label: 'My List', iconData: Icons.add),
              LargeIconButton(label: 'Rate', iconData: Icons.thumb_up_outlined),
              LargeIconButton(label: 'Trailer', iconData: Icons.play_arrow),
            ],
          )
        ],
      ),
    );
  }
}

class LargeIconButton extends StatelessWidget {
  const LargeIconButton({Key key, this.iconData, this.label}) : super(key: key);

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, size: 30.0),
        SizedBox(height: 4.0),
        Text(label, style: TextStyle(fontSize: 12.0, color: Colors.grey))
      ],
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
        color: Colors.grey[800].withOpacity(0.75),
        border: Border.all(color: Colors.grey[800].withOpacity(0.75)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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

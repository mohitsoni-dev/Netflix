import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/widgets/FeaturedCard.dart';
import 'package:netflix/widgets/HomepageAppbar.dart';
import 'package:netflix/widgets/item_card_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverStack(
            children: [
              Content(user: firebaseUser),
              HomePageAppBar(
                key: PageStorageKey('AppBar'),
                scrollOffset: scrollOffset,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  final User user;
  Content({@required this.user});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          //TODO: Content to be Transferred for featured content
          FeaturedCard(
            //TODO:  to be supplied with actual content
            content: "jjba",
          ),
          Category(
            title: "Popular on Netflix",
            contentList: null,
          ),
          Category(
            title:
                "Continue Watching for ${strstr(user.email, '@', before: true)}",
            contentList: [],
          ),
        ],
      ),
    );
  }

  String strstr(String myString, String pattern, {bool before = false}) {
    var index = myString.indexOf(pattern);
    if (index < 0) return null;
    if (before) return myString.substring(0, index);
    return myString.substring(index + pattern.length);
  }
}

class Category extends StatelessWidget {
  final String title;
  //TODO: verify that this is not null and use this list in place of listview.builder
  final List contentList;

  Category({this.title, this.contentList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                ItemCard(myList: false, content: 'jjba'),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix/widgets/HomepageAppbar.dart';

class HomePage extends StatefulWidget {
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
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                HomePageAppBar(scrollOffset),
                SliverToBoxAdapter(
                  child: Container(
                    height: 2000,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

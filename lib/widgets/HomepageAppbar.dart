import "package:flutter/material.dart";

class HomePageAppBar extends StatelessWidget {
  final double scrollOffset;

  HomePageAppBar(this.scrollOffset);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      bottom: PreferredSize(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _AppCategory(name: "TV Shows"),
            _AppCategory(name: "Movies"),
            _AppCategory(name: "Categories"),
          ],
        ),
        preferredSize: Size(size.width, 0),
      ),
      centerTitle: true,
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black45
          .withOpacity((scrollOffset / 150).clamp(0, 0.7).toDouble())),
      shadowColor: Colors.transparent,
      pinned: true,
      floating: false,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: EdgeInsets.only(
            bottom: 30.0,
          ), //symmetric(vertical: 20.0, horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                child: Image.asset("assets/logo.png"),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: IconButton(
                      icon: Image.asset('assets/search.png'),
                      iconSize: 30,
                      onPressed: () {
                        //TODO: Navigate to Search page
                      },
                    ),
                  ),
                  //TODO: Add DP here
                  GestureDetector(
                    onTap: () {
                      //TODO: Navigate to user profile page
                    },
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          child: Image.asset('assets/logo.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AppCategory extends StatelessWidget {
  final String name;

  _AppCategory({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}

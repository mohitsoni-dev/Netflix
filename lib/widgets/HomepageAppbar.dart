import "package:flutter/material.dart";

class HomePageAppBar extends StatelessWidget {
  final double scrollOffset;

  HomePageAppBar(this.scrollOffset);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      bottom: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppCategory(name: "TV Shows"),
              _AppCategory(name: "Movies"),
              _AppCategory(
                name: "Categories",
                icon: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
        preferredSize: Size(size.width, 50),
      ),
      centerTitle: true,
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black45
          .withOpacity((scrollOffset / 150).clamp(0, 0.7).toDouble())),
      shadowColor: Colors.transparent,
      pinned: true,
      floating: true,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: EdgeInsets.only(
            bottom: 30.0,
          ), //symmetric(vertical: 20.0, horizontal: 5.0),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  child: Image.asset("assets/logo.png"),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
      ),
    );
  }
}

class _AppCategory extends StatelessWidget {
  final String name;
  final Icon icon;

  _AppCategory({@required this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          icon ?? Container()
        ],
      ),
    );
  }
}

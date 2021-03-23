import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflix/Screens/HomePage.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screen = [
    HomePage(
      key: PageStorageKey('HomeScreen'),
    ),
    Scaffold(), //TODO: Replace these scaffolds with appropriate screens
    Scaffold(),
  ];

  final Map<String, List<IconData>> _icons = const {
    'Home': [
      MaterialCommunityIcons.home_variant_outline,
      MaterialCommunityIcons.home_variant,
    ],
    'Stream': [
      Icons.stream,
      Icons.stream,
    ],
    'Download': [
      FlutterIcons.cloud_download_outline_mco,
      FlutterIcons.cloud_download_mco
    ],
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        items: _icons
            .map(
              (title, icons) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(
                    icons[0],
                    size: 30,
                  ),
                  activeIcon: Icon(
                    icons[1],
                    size: 30,
                  ),
                  label: title,
                ),
              ),
            )
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 10.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 10.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

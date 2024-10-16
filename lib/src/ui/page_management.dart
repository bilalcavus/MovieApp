import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sm_project/src/ui/coming_soon.dart';
import 'package:sm_project/src/ui/movie_list.dart';
import 'package:sm_project/src/ui/searching_page.dart';
import 'package:sm_project/src/ui/vision_movies.dart';

class NowPlayingMovieList extends StatefulWidget {
  const NowPlayingMovieList({super.key});

  @override
  State<NowPlayingMovieList> createState() => _NowPlayingMovieListState();
}

class _NowPlayingMovieListState extends State<NowPlayingMovieList> {
 final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _customTabBar(),
      backgroundColor: ColorItems.scaffoldColor,
      body: _pageManagement(),
    );
  }

  PageView _pageManagement() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });},
      children:const  [
        VisionMovies(),
        MovieList(),
        SearchingPage(),
        ComingSoon(),
      ],
    );
  }

  Container _customTabBar() {
    return Container(
      color: ColorItems.tabBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: gNavBar(),
      ),
    );
  }

  GNav gNavBar() {
    return GNav(
        backgroundColor: ColorItems.tabBarColor,
        color: ColorItems.wTabBarColor,
        activeColor: ColorItems.wTabBarColor,
        gap: 12,
        padding: const EdgeInsets.all(12),
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        tabs: const [
          GButton(icon: Icons.play_circle_outline, iconActiveColor: ColorItems.orangeAccent, text: 'Vision', iconSize: 30, textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorItems.orangeAccent),),
          GButton(icon: Icons.local_play_outlined, iconActiveColor: ColorItems.orangeAccent, text: 'Favourite' ,iconSize: 30, textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color:ColorItems.orangeAccent),),
          GButton(icon: Icons.search_rounded, iconActiveColor: ColorItems.orangeAccent, text: 'Search',iconSize: 30, textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorItems.orangeAccent),),
          GButton(icon: Icons.access_time_outlined, iconActiveColor: ColorItems.orangeAccent, text: 'Soon', iconSize: 30, textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorItems.orangeAccent),),
        ],
      );
  }
}

class ColorItems {
  static const Color scaffoldColor = Color.fromARGB(31, 0, 0, 0);
  static const Color cardColor = Color.fromARGB(255, 5, 20, 34);
  static const Color tabBarColor = Colors.transparent;
  static const Color wTabBarColor = Colors.white;
  static const Color rTabBarColor = Colors.grey;
  static const Color orangeAccent = Colors.orangeAccent;
}
  
import 'package:dhekho_app/Screens/favourite_screen.dart';
import 'package:dhekho_app/Screens/homepage.dart';
import 'package:dhekho_app/Screens/playlist_screen.dart';
import 'package:dhekho_app/Screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const SearchScreen(),
    const FavouriteScreen(),
    const PlaylistScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: const Color(0xFF362360),
        child:  Padding(
          padding:const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: GNav(
              padding: const EdgeInsets.all(14),
              iconSize: 25,
              textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              gap: 8,
              backgroundColor: const Color(0xFF362360),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 77, 49, 137),
              tabs: const[
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favourites',
                ),
                GButton(
                  icon: Icons.playlist_add,
                  text: 'Playlist',
                )
              ],
              onTabChange: _navigateBottomBar),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix_responisve_ui/widgets/widgets.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(
      key: PageStorageKey('homeScreen'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu
  };
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? BottomNavigationBar(
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                items: _icons
                    .map(
                      (title, icon) => MapEntry(
                        title,
                        BottomNavigationBarItem(
                          icon: Icon(
                            icon,
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
                unselectedItemColor: Colors.grey,
                selectedFontSize: 11,
                unselectedFontSize: 11,
                onTap: (index) => setState(() => _currentIndex = index),
              )
            : const SizedBox.shrink());
  }
}

import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (position) {
          setState(() {
            _position = position;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _position,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: '沸点'),
          BottomNavigationBarItem(icon: Icon(Icons.zoom_out), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '课程'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '我'),
        ]);
  }
}

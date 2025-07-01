import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomNavBar({Key? key, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            if (currentIndex != 0) {
              Navigator.pushReplacementNamed(context, '/home');
            }
            break;
          case 1:
            if (currentIndex != 1) {
              Navigator.pushReplacementNamed(context, '/history');
            }
            break;
          case 2:
            if (currentIndex != 2) {
              Navigator.pushReplacementNamed(context, '/leave');
            }
            break;
          case 3:
            if (currentIndex != 3) {
              Navigator.pushReplacementNamed(context, '/profile');
            }
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app),
          label: "Leave",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}

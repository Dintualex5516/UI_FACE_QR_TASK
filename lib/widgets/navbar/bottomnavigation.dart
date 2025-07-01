import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int? currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex ?? -1, // required, but we handle null state
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Apply'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Status'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}







// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;

//   const CustomBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Color primaryColor = Color(0xFF007AFF); 

//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       selectedItemColor: primaryColor,
//       unselectedItemColor: Colors.grey,
//       type: BottomNavigationBarType.fixed,
//       selectedLabelStyle: TextStyle(fontSize: 12),
//       unselectedLabelStyle: TextStyle(fontSize: 12),
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home, size: 24), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.history, size: 24), label: "History"),
//         BottomNavigationBarItem(icon: Icon(Icons.time_to_leave, size: 24), label: "Leave"),
//         BottomNavigationBarItem(icon: Icon(Icons.person, size: 24), label: "Profile"),
//       ],
//       onTap: onTap,
//     );
//   }
// }

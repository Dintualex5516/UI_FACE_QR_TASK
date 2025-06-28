import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String role;

  const CustomAppBar({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.blue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          role,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(), 
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                _buildOvalIcon(Icons.notifications_active),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.15,
          top: 23,
          child: const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage("assets/images/ziya.jpeg"),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildOvalIcon(IconData iconData) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: Icon(iconData, size: 20, color: Colors.blue),
  );
}

}


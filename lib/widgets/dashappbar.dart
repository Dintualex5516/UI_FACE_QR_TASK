import 'package:flutter/material.dart';
import 'package:ui_task/views/dashboard%20pages/leaves/searchhistory.dart';

class AppBarHistory extends StatefulWidget implements PreferredSizeWidget {
  const AppBarHistory({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<AppBarHistory> createState() => _AppBarHistoryState();
}

class _AppBarHistoryState extends State<AppBarHistory> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // OverlayEntry _createOverlayEntry() {
  //   RenderBox renderBox = context.findRenderObject() as RenderBox;
  //   final offset = renderBox.localToGlobal(Offset.zero);

  //   return OverlayEntry(
  //     builder: (context) => Positioned(
  //       left: offset.dx + 20,
  //       top: offset.dy + 50,
  //       width: MediaQuery.of(context).size.width - 40,
  //       child: Material(
  //         elevation: 8,
  //         borderRadius: BorderRadius.circular(12),
  //         child: SearchHistoryPopup(onClose: _hideOverlay),
  //       ),
  //     ),
  //   );
  // }
  OverlayEntry _createOverlayEntry() {
  RenderBox renderBox = context.findRenderObject() as RenderBox;
  final offset = renderBox.localToGlobal(Offset.zero);

  return OverlayEntry(
    builder: (context) => Positioned(
      left: offset.dx + 20,
      top: offset.dy + 40,
      width: MediaQuery.of(context).size.width - 40,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: SearchHistoryPopup(
          onBack: _hideOverlay, // Use this to close the overlay when back arrow is pressed
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 243, 243),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: SafeArea(
        child: Stack(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/ziya.jpeg",
                    height: 20,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              titleSpacing: 15,
              title: GestureDetector(
                onTap: _showOverlay,
                child: CompositedTransformTarget(
                  link: _layerLink,
                  child: Container(
                    height: 36,
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Search",
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  icon: ClipOval(
                    child: Image.asset(
                      "assets/images/dd.jpg",
                      height: 34,
                      width: 34,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              foregroundColor: Colors.black,
            ),
            // Positioned(
            //   top: 12,
            //   left: 8,
            //   child: IconButton(
            //     icon: const Icon(Icons.arrow_back),
            //     onPressed: () => Navigator.of(context).pop(),
            //   ),
            // ),
            // Positioned(
            //   top: 12,
            //   right: 8,
            //   child: IconButton(
            //     icon: const Icon(Icons.arrow_forward, color: Colors.green),
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


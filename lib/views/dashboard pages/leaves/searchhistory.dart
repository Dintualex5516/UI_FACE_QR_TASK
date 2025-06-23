 

// import 'package:flutter/material.dart';

// class SearchHistoryPopup extends StatelessWidget {
//   final VoidCallback onClose;

//   const SearchHistoryPopup({super.key, required this.onClose});

//   @override
//   Widget build(BuildContext context) {
//     final date = DateTime.now();
//     const records = [
//       "Sick Leave...",
//       "23 May 2025...",
//       "Casual Leaves...",
//     ];
//     const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
//     final formattedDate = '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]} ${date.year}';

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             blurRadius: 6,
//             color: Colors.black26,
//             offset: Offset(0, 2),
//           )
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 formattedDate,
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               GestureDetector(
//                 onTap: onClose,
//                 child: const Icon(Icons.close, size: 22, color: Colors.grey),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Search History',
//             style: TextStyle(fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 8),
//           ...records.map((r) => Padding(
//             padding: const EdgeInsets.symmetric(vertical: 4),
//             child: Text(
//               r,
//               style: const TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SearchHistoryPopup extends StatelessWidget {
  final VoidCallback onBack;

  const SearchHistoryPopup({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final date = DateTime(2025, 5, 5); // fixed date to match your screenshot
    const records = [
      "Sick Leave...",
      "23 May 2025...",
      "Casual Leaves...",
    ];
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final formattedDate =
        '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]} ${date.year}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black26,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row with Back Arrow, Date, and Right Arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Back arrow and date
              Row(
                children: [
                  GestureDetector(
                    onTap: onBack,
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        size: 20, color: Colors.black87),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              /// Right green arrow
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          /// Search History Label
          const Text(
            'Search History',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),

          /// Records
          ...records.map((r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  r,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )),
        ],
      ),
    );
  }
}

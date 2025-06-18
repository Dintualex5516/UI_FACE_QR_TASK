

// import 'package:flutter/material.dart';
// import 'package:ui_task/views/Task%20section/ongoing_tasks_content.dart';
// import 'package:ui_task/views/login/onlinemode/face_verification.dart';
// import 'package:ui_task/views/login/logout/logoutflow.dart';
// import '../Task section/my_tasks_content.dart';
// import '../Task section/task_tracker_content.dart';
// import '../../widgets/bottomnavigation.dart'; 

// import '../Task section/ongoing_tasks_content.dart';
// import '../Task section/work_summary_content.dart';

// enum SelectedTab { none, myTasks, taskTracker, ongoing, workSummary }
// String _sortBy = 'Deadline';


// Widget _buildOvalIcon(IconData iconData) {
//   return Container(
//     padding: const EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black12,
//           blurRadius: 4,
//           offset: Offset(2, 2),
//         ),
//       ],
//     ),
//     child: Icon(iconData, size: 20, color: Colors.blue),
//   );
// }


// //  Widget _buildOvalIconWithAsset(String assetPath) {
// //   return Container(
// //     padding: const EdgeInsets.all(6),
// //     decoration: BoxDecoration(
// //       shape: BoxShape.circle,
// //       color: Colors.white,
// //       boxShadow: [
// //         BoxShadow(
// //           color: Colors.black12,
// //           blurRadius: 4,
// //           offset: Offset(2, 2),
// //         ),
// //       ],
// //     ),
// //     child: ClipOval(
// //       child: Image.asset(
// //         assetPath,
// //         width: 32,
// //         height: 32,
// //         fit: BoxFit.cover,
// //       ),
// //     ),
// //   );
// // }


// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final Color primaryColor = Color(0xFF007AFF);
//   final Color backgroundColor = Color(0xFFF6F7FB);

//   int _currentIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
    
//     });
//   }

//   SelectedTab selected = SelectedTab.none;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) => SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: Column(

//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // -----------------customm  appbar 
//                   //           
//                 Stack(

//                   children: [
//                     Row(
//                       children: [
                        
//                         Container(
//                           height: 100,

//                           width: MediaQuery.of(context).size.width * 0.8,
//                           decoration: const BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.green, Colors.blue],
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                             ),
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(40),
//                               topRight: Radius.circular(40),
//                            ),
//                          ),
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: Row(
//                          children: [
//                            CircleAvatar(
//                               radius: 28,
//                               backgroundImage: NetworkImage(
//                                 "https://media.licdn.com/dms/image/v2/D5603AQG8pugqWanzNA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1722544790022?e=1755129600&v=beta&t=GmN-4Hoar1stXcXngmfE5y2fO6JwPQrpLIulL1wALYs",
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: const [
//                                    SizedBox(height: 20),
//                                    Text(
//                                      "Dintu Alex",
//                                      style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 16,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Full‑stack Developer",
//                                     style: TextStyle(color: Colors.black87),
//                                   ),
//                                 ],
//                                ),
//                              ),
//                             SizedBox(), 
//                            ],
//                          ),
//                        ),
                      
//                      Row(
//                       children: [
//                           const SizedBox(width: 30),
//                           _buildOvalIcon(Icons.notifications_active),
//                          ],
//                        ),
//                        const SizedBox(width: 10),
//                      ],
//                    ),

//                     // Ziya logo ---------------------------------------

//                     Positioned(
//                       right: MediaQuery.of(context).size.width * 0.15,
//                       top: 23,
//                       child: CircleAvatar(
//                         radius: 28,
//                         backgroundImage: AssetImage("assets/images/ziya.jpeg"),
//                         backgroundColor: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),


//                   // Greeting
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                     child: Text("Good Morning,\nDintu Alex Varghese",
//                       style: TextStyle(fontSize: 17, color: const Color.fromARGB(221, 75, 71, 71))),
//                   ),

//                   // Check-In Card
//                  Padding(
//   padding: EdgeInsets.symmetric(horizontal: 16),
//   child: Container(
//     padding: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Green Checked-In message
//         Text(
//           '"You are Checked-In 09:00 AM"',
//           style: TextStyle(
//             color: Colors.green.shade700,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 12),

//         // Time row
//         Row(
//           children: [
//             Icon(Icons.access_time_rounded, color: Colors.orange),
//             SizedBox(width: 6),
//             Text(
//               "09:20 am, 11-06-2025",
//               style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),

//         SizedBox(height: 6),

//         // Location row
//         Row(
//           children: [
//             Icon(Icons.location_pin, color: Colors.red),
//             SizedBox(width: 6),
//             Text(
//               "Location/IP (for remote attendance)",
//               style: TextStyle(color: Colors.black87),
//             ),
//           ],
//         ),

//         SizedBox(height: 16),

       
//         Row(
//           children: [
          
//             ElevatedButton.icon(
//               onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FaceVerificationScreen(isCheckout: false),
//       ),
//     );
//   },
//               icon: Icon(Icons.refresh),
//               label: Text("Check In"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey.shade300,
//                 foregroundColor: Colors.black54,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//             ),
//             SizedBox(width: 12),
           
//             ElevatedButton.icon(
//               onPressed: () {
//                  {

//     showCheckoutConfirmationDialog(context);
//                  }
//               },
//               icon: Icon(Icons.logout_rounded),
//               label: Text("Check Out"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue.shade600,
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// ),
                  
//                   Padding(
//                     padding: EdgeInsets.only(left: 16, top: 20, bottom: 16),
//                     child: Text("Overview",
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _overviewCard("Presence", "20", Colors.green),
//                         _overviewCard("Absence", "03", Colors.red),
//                         _overviewCard("Leaves", "02", Colors.orange),
//                       ],
//                     ),
//                   ),

                
//                   Container(
//                     height: 60,
//                     margin: EdgeInsets.symmetric(vertical: 16),
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       children: [
//                         _tabButton(SelectedTab.myTasks, Icons.task_alt, "My Tasks"),
//                         _tabButton(SelectedTab.taskTracker, Icons.timer, "Task Tracker"),
//                         _tabButton(SelectedTab.ongoing, Icons.pending_actions, "Ongoing & Pending"),
//                         _tabButton(SelectedTab.workSummary, Icons.work_outline, "Work Summary"),
//                       ],
//                     ),


                    
//                   ),
                  

//                   Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//   child: Row(
//     children: [
//       Text('Sort By:', style: TextStyle(fontWeight: FontWeight.w600)),
//       SizedBox(width: 12),
//       Expanded(
//         child: Row(
//           children: ['Deadline', 'Project'].map((label) {
//             bool selected = _sortBy == label;
//             return Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Radio<String>(
//                   value: label,
//                   groupValue: _sortBy,
//                   activeColor: Theme.of(context).primaryColor,
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   onChanged: (val) => setState(() => _sortBy = val!),
//                 ),
//                 Text(label, style: TextStyle(color: selected ? Theme.of(context).primaryColor : Colors.grey[800])),
//                 SizedBox(width: 16),
//               ],
//             );
//           }).toList(),
//         ),
//       ),

      
//       InkWell(
//         onTap: () {
//           // TODO
//         },
//         borderRadius: BorderRadius.circular(20),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Icon(Icons.filter_list, color: Theme.of(context).primaryColor),
//         ),
//       ),
//     ],
//   ),
// ),

//                   // Inline Content---------------
//                   if (selected == SelectedTab.myTasks)
//                     MyTasksContent(scrollController: ScrollController())
//                   else if (selected == SelectedTab.taskTracker)
//                     TaskTrackerContent(scrollController: ScrollController())
//                   else if (selected == SelectedTab.ongoing)
//                     OngoingPendingContent(scrollController: ScrollController())
//                   else if (selected == SelectedTab.workSummary)
//                     WorkSummaryContent(scrollController: ScrollController()),

//                   // Dashboard Section 
//                       Divider(),
//                   Padding(
//                     padding: EdgeInsets.only(left: 16,  bottom: 16),
//                     child: Text("Dashboard", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: GridView.count(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: [
//                         _dashboardItem(Icons.calendar_month, "Attendance", Colors.green),
//                         _dashboardItem(Icons.logout, "Leaves", Colors.orange),
//                         _dashboardItem(Icons.check_circle, "Leave Status", Colors.purple),
//                         _dashboardItem(Icons.list_alt, "Holiday List", Colors.blue),
//                         _dashboardItem(Icons.receipt_long, "Payslip", Colors.teal),
//                         _dashboardItem(Icons.bar_chart, "Reports", Colors.red),
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: _onItemTapped,
//     ),
//     );
//   }

//   Widget _tabButton(SelectedTab tab, IconData icon, String label) {
//     final bool active = selected == tab;
//     return Padding(
//       padding: EdgeInsets.only(right: 12),
//       child: ElevatedButton.icon(
//         onPressed: () {
//           setState(() {
//             selected = active ? SelectedTab.none : tab;
//           });
//         },
//         icon: Icon(icon, color: active ? primaryColor : Colors.grey),
//         label: Text(label, style: TextStyle(color: active ? primaryColor : Colors.grey[800])),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           side: BorderSide(color: active ? primaryColor : Colors.grey.shade300),
//           elevation: 2,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//     );
//   }

//   Widget _overviewCard(String title, String count, Color color) {
//     return Container(
//       width: 100,
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
//       ),
//       child: Column(
//         children: [
//           Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
//           SizedBox(height: 4),
//           Text(title, style: TextStyle(color: Colors.grey[700])),
//         ],
//       ),
//     );
//   }

//   Widget _dashboardItem(IconData icon, String label, Color color) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(radius: 28, backgroundColor: color.withOpacity(0.2),
//           child: Icon(icon, color: color, size: 28)),
//         SizedBox(height: 6),
//         Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
//       ],
//     );
//   }
// }

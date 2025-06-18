import 'package:flutter/material.dart';
import 'package:ui_task/views/homescreens/loginhomescreen.dart';
import 'package:ui_task/views/login/logout/logoutflow.dart';
import 'package:ui_task/views/login/offline%20mode/QR_ver_screen.dart';
import 'package:ui_task/views/login/onlinemode/face_verification.dart';
// import 'package:ui_task/views/login/offline%20mode/QRVerificationScreen.dart';
import 'package:ui_task/widgets/customappbar.dart';
import 'package:ui_task/widgets/dashboardgrid.dart';
import 'package:ui_task/widgets/overview.dart';
import '../../widgets/bottomnavigation.dart'; 
import 'package:ui_task/services/punch_method_service.dart';

enum SelectedTab { none, myTasks, taskTracker, ongoing, workSummary }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color primaryColor = Color(0xFF007AFF);
  final Color backgroundColor = Color(0xFFF6F7FB);
  int _currentIndex = 0;
  SelectedTab selected = SelectedTab.none;

  String? _punchMethod;

  @override
  void initState() {
    super.initState();
    loadPunchInMethod();
  }

  Future<void> loadPunchInMethod() async {
    String? method = await getPunchInMethod();
    setState(() {
      _punchMethod = method;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height:10),
                  CustomAppBar(
                    profileImageUrl: "https://media.licdn.com/dms/image/v2/D5603AQG8pugqWanzNA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1722544790022?e=1755129600&v=beta&t=GmN-4Hoar1stXcXngmfE5y2fO6JwPQrpLIulL1wALYs",
                    name: "Hermanth Rangarajan",
                    role: "Full‑stack Developer",
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text("Good Morning,\nHermanth Rangarajan",
                        style: TextStyle(fontSize: 17, color: const Color.fromARGB(221, 75, 71, 71))),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '"You are Checked-In 09:00 AM"',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.access_time_rounded, color: Colors.orange),
                              SizedBox(width: 6),
                              Text(
                                "09:20 am, 11-06-2025",
                                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.location_pin, color: Colors.red),
                              SizedBox(width: 6),
                              Text(
                                "Location/IP (for remote attendance)",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => FaceVerificationScreen(isCheckout: false),
                                  //   ),
                                  // );
                                },
                                icon: Icon(Icons.refresh),
                                label: Text("Check In"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade300,
                                  foregroundColor: Colors.black54,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(width: 12),
                             ElevatedButton.icon(
                              icon: const Icon(Icons.logout),
                              label: const Text("Check Out"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                              onPressed: () {
                                showCheckoutConfirmationDialog(
                                                            context,
                                                            punchMethod: _punchMethod,
                                                          );
                              },
                            ),
                                // --------confirm check out box here venam
                              //   onPressed: () async {
                              //     if (_punchMethod == 'face') {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (_) => FaceVerificationScreen(isCheckout: true),
                              //         ),
                              //       );
                              //     } else if (_punchMethod == 'qr') {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (_) => QRVerificationScreen(isCheckout: true),
                              //         ),
                              //       );
                              //     } else {
                              //       showDialog(
                              //         context: context,
                              //         builder: (context) => AlertDialog(
                              //           title: Text("Error"),
                              //           content: Text("Punch in method not found."),
                              //           actions: [
                              //             TextButton(
                              //               onPressed: () => Navigator.pop(context),
                              //               child: Text("OK"),
                              //             )
                              //           ],
                              //         ),
                              //       );
                              //     }
                              //   },
                                
                              //   icon: Icon(Icons.logout_rounded),
                              //   label: Text("Check Out"),
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.blue.shade600,
                              //     foregroundColor: Colors.white,
                              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              //   ),
                              // ),
                              // -------------------------------------------------------
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const overviewcontent(),
                  const DashboardGrid(),
                  Divider(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

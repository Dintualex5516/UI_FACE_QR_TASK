import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task/viewmodel/homescreenmodel.dart';
import 'package:ui_task/views/homescreens/loginhomescreen.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/logout/logoutflow.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/offline%20mode/QR_ver_screen.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/onlinemode/face_verification.dart';
import 'package:ui_task/widgets/customappbar.dart';
import 'package:ui_task/widgets/dashboardgrid.dart';
import 'package:ui_task/widgets/navbar/navabr.dart';
import 'package:ui_task/widgets/overview.dart';

import 'package:ui_task/widgets/navbar/bottomnavigation.dart';

enum SelectedTab { none, myTasks, taskTracker, ongoing, workSummary }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color primaryColor = Color(0xFF007AFF);
  final Color backgroundColor = Color(0xFFF6F7FB);
  SelectedTab selected = SelectedTab.none;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<HomeScreenViewModel>(context, listen: false).loadPunchInMethod());
  }

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeScreenViewModel>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
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
                                onPressed: () {},
                                icon: Icon(Icons.refresh),
                                label: Text("Punch In"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade300,
                                  foregroundColor: Colors.black54,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(width: 12),
                              ElevatedButton.icon(
                                icon: const Icon(Icons.logout),
                                label: const Text("Punch Out"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                ),
                                onPressed: () {
                                  
                                  homeVM.showCheckoutConfirmationDialog(context, homeVM.punchMethod);
                                  
                                },
                              ),
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
      bottomNavigationBar:CustomNavBar(currentIndex: 0)
    );
  }
}

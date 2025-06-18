import 'package:flutter/material.dart';
import 'package:ui_task/views/login/logout/logoutflow.dart';
import 'package:ui_task/views/login/offline%20mode/QR_ver_screen.dart';
import 'package:ui_task/views/login/offlineRemote_screen.dart';
import 'package:ui_task/views/login/onlinemode/face_verification.dart';
import 'package:ui_task/widgets/bottomnavigation.dart';
import 'package:ui_task/services/punch_method_service.dart';

enum SelectedTab { none, myTasks, taskTracker, ongoing, workSummary }
enum PunchMode { offline, online }
String _sortBy = 'Deadline';

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

class LoginHomeScreen extends StatefulWidget {
  @override
  _LoginHomeScreenState createState() => _LoginHomeScreenState();
}

class _LoginHomeScreenState extends State<LoginHomeScreen> {
  final Color primaryColor = Color(0xFF007AFF);
  final Color backgroundColor = Color(0xFFF6F7FB);

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  SelectedTab selected = SelectedTab.none;

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
                children: [ SizedBox(height:10),
                  Stack(
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
                                  backgroundImage: NetworkImage(
                                    "https://media.licdn.com/dms/image/v2/D5603AQG8pugqWanzNA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1722544790022?e=1755129600&v=beta&t=GmN-4Hoar1stXcXngmfE5y2fO6JwPQrpLIulL1wALYs",
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(height: 20),
                                      Text(
                                        "Hermanth Rangarajan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Full‑stack Developer",
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(),
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
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage("assets/images/ziya.jpeg"),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text(
                      "Good Morning,\nHermanth Rangarajan",
                      style: TextStyle(fontSize: 17, color: const Color.fromARGB(221, 75, 71, 71)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You Haven't Punched In yet",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 17),
                          Row(
                            children: [

                              ElevatedButton.icon(
                                onPressed: () {
                                  showmModeConfirmationDialog(context);
                                },
                                icon: Icon(Icons.login, color: Colors.white),
                                label: Text("Punch In", style: TextStyle(color: Colors.white,fontSize: 13)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 65, 142, 230),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6), 
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  elevation: 4,
                                ),
                              ),
                           
                              SizedBox(width: 30),

                              ElevatedButton.icon(
                              onPressed: () async {
                               
                              },
                              icon: Icon(Icons.logout, color: Colors.white),
                              label: Text("Punch Out", style: TextStyle(color: Colors.white,fontSize: 13)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 141, 142, 143),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                elevation: 4,
                              ),
                            ),

                            
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 20, bottom: 16),
                    child: Text("Overview", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _overviewCard("Presence", "20", Colors.green),
                        _overviewCard("Absence", "03", Colors.red),
                        _overviewCard("Leaves", "02", Colors.orange),
                      ],
                    ),
                  ),  SizedBox(height:20),
                  // Divider(),
                  SizedBox(height:20),
                  Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 19),
                    child: Text("Dashboard", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _dashboardItem(Icons.calendar_month, "Attendance", Colors.green),
                        _dashboardItem(Icons.logout, "Leaves", Colors.orange),
                        _dashboardItem(Icons.check_circle, "Leave Status", Colors.purple),
                        _dashboardItem(Icons.list_alt, "Holiday List", Colors.blue),
                        _dashboardItem(Icons.receipt_long, "Payslip", Colors.teal),
                        _dashboardItem(Icons.bar_chart, "Reports", Colors.red),
                      ],
                    ),
                  ),
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

  Widget _tabButton(SelectedTab tab, IconData icon, String label) {
    final bool active = selected == tab;
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            selected = active ? SelectedTab.none : tab;
          });
        },
        icon: Icon(icon, color: active ? primaryColor : Colors.grey),
        label: Text(label, style: TextStyle(color: active ? primaryColor : Colors.grey[800])),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: active ? primaryColor : Colors.grey.shade300),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _overviewCard(String title, String count, Color color) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget _dashboardItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 28),
        ),
        SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

























































import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:ui_task/views/punch%20in%20out%20screens/logout/logoutflow.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/offlineRemote_screen.dart';
// import 'package:ui_task/views/punch%20in%20out%20screens/onlinemode/face_verification.dart';
import 'package:ui_task/widgets/navbar/bottomnavigation.dart';
import 'package:ui_task/viewmodel/login_home_viewmodel.dart';

class LoginHomeScreen extends StatelessWidget {
  final Color primaryColor = const Color(0xFF007AFF);
  final Color backgroundColor = const Color(0xFFF6F7FB);

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

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginHomeViewModel>(
      builder: (context, vm, _) {
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
                      const SizedBox(height: 10),
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
                                    const CircleAvatar(
                                      radius: 28,
                                      backgroundImage: NetworkImage(
                                        "https://media.licdn.com/dms/image/v2/D5603AQG8pugqWanzNA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1722544790022?e=1755129600&v=beta&t=GmN-4Hoar1stXcXngmfE5y2fO6JwPQrpLIulL1wALYs",
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
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
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage("assets/images/ziya.jpeg"),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          "Good Morning,\nHermanth Rangarajan",
                          style: TextStyle(fontSize: 17, color: Color.fromARGB(221, 75, 71, 71)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "You Haven't Punched In yet",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 17),
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      showmModeConfirmationDialog(context);
                                    },
                                    icon: const Icon(Icons.login, color: Colors.white),
                                    label: const Text("Punch In", style: TextStyle(color: Colors.white, fontSize: 13)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 65, 142, 230),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      elevation: 4,
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  ElevatedButton.icon(
                                    onPressed: () async {},
                                    icon: const Icon(Icons.logout, color: Colors.white),
                                    label: const Text("Punch Out", style: TextStyle(color: Colors.white, fontSize: 13)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 141, 142, 143),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      elevation: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16, top: 20, bottom: 16),
                        child: Text("Overview", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _overviewCard("Presence", "20", Colors.green),
                            _overviewCard("Absence", "03", Colors.red),
                            _overviewCard("Leaves", "02", Colors.orange),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 16, bottom: 19),
                        child: Text("Dashboard", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: vm.currentIndex,
            onTap: vm.updateIndex,
          ),
        );
      },
    );
  }

  Widget _overviewCard(String title, String count, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
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
        const SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}















































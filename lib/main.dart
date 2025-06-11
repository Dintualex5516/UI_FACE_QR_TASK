import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  final Color primaryColor = Color(0xFF007AFF);
  final Color backgroundColor = Color(0xFFF6F7FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top User Info
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                         backgroundImage: NetworkImage("https://media.licdn.com/dms/image/v2/D5603AQG8pugqWanzNA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1722544790022?e=1755129600&v=beta&t=GmN-4Hoar1stXcXngmfE5y2fO6JwPQrpLIulL1wALYs"), 
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dintu Alex Varghese",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("Full-stack Developer", style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Icon(Icons.notifications, color: primaryColor),
                      ],
                    ),
                  ),

                  // Good Morning Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text(
                      "“Good Morning,\nDintu Alex Varghese”",
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  ),

                  // Check-In Card
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
                          Text("‘You haven’t Checked-in yet’", style: TextStyle(color: Colors.red)),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Check In"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: null,
                                child: Text("Check Out"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  foregroundColor: Colors.black54,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // "Overview" Heading
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 20, bottom: 16),
                    child: Text(
                      "Overview",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),

                  // Overview Cards
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
                  ),

                  // "Dashboard" Heading
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 20, bottom: 16),
                    child: Text(
                      "Dashboard",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),

                  // Dashboard Icons Grid
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
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
                  ),
                ],
              ),
            );
          },
        ),
      ),

      // Bottom Navigation Bar (center aligned)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 24), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history, size: 24), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.time_to_leave, size: 24), label: "Leave"),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 24), label: "Profile"),
        ],
      ),
    );
  }

  // Overview Card
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

  // Dashboard Item
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

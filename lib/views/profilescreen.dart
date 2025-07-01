import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:ui_task/widgets/navbar/bottomnavigation.dart';
import 'package:ui_task/viewmodel/homescreenmodel.dart';
import 'package:ui_task/widgets/navbar/navabr.dart'; 
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  final String name = "Hemant Rangarajan";
  final String employeeId = "EMP00123";
  final String designation = "Full‑Stack Developer";
  final String department = "Software Development Team";

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeScreenViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
           Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              Positioned(
                bottom: 46,
                left: 160,
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily:'PoppinsBold ',
                    color: Colors.lightBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(1, 1),
                        blurRadius: 4,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(

                bottom: 20,
                left: 160,
                child: Text(
                  designation,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(1, 1),
                        blurRadius: 4,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/dp.jpg'),
                  ),
                ),
              ),
            ],
          ),

            SizedBox(height: 60),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: Colors.white, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildRow("Name            ", name),
                    _buildDottedDivider(),
                    _buildRow("Employee ID  ", employeeId),
                  _buildDottedDivider(),
                    _buildRow("Designation  ", designation),
                  _buildDottedDivider(),
                    _buildRow("Department  ", department),
                  ],
                ),
              ),
            ),
          ),

            SizedBox(height: 32),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(
              'assets/images/pana.svg',
              fit: BoxFit.contain,
              width: 200,
              height: 200,
              semanticsLabel: 'Profile illustration',
             )
              ),
            ),SizedBox(height:30),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400), 
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                 onPressed: () {
            
                      },
                      child: Text(
                        "Start work",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 46, 157, 248),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 3)
    );
  }

  Widget _buildRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "$title :",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value,
            style: TextStyle(color: Colors.grey[700],fontSize: 12),
          ),
        ),
      ],
    );
  }
 Widget _buildDottedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: DottedLine(
        dashLength: 3,
        dashGapLength: 2,
        lineThickness: .5,
        dashColor: Colors.grey,
      ),
    );
  }

}

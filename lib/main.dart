import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:ui_task/viewmodel/holiday_viewmodel.dart';
import 'package:ui_task/viewmodel/homescreenmodel.dart';
import 'package:ui_task/views/homescreens/homescreen.dart';
import 'package:ui_task/views/homescreens/loginhomescreen.dart';
import 'package:ui_task/views/profilescreen.dart';

import 'firebase_options.dart';
import 'model/auth_model.dart';
import 'viewmodel/login_viewmodel.dart';
import 'viewmodel/signup_viewmodel.dart';
import 'viewmodel/forgotpassword_vm.dart';
import 'viewmodel/login_home_viewmodel.dart';
import 'views/login & signup screens/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginHomeViewModel()),
        ChangeNotifierProvider(create: (_) => HolidayViewModel()),
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel(AuthModel())),
        ChangeNotifierProvider(create: (_) => SignupViewModel(AuthModel())),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel(AuthModel())),
      ],
      child: MaterialApp(
        theme: ThemeData(
    fontFamily: 'PoppinsLight', 
    // primarySwatch: Colors.blue,
  ),
        debugShowCheckedModeBanner: false,
        home: LoginPage(), 
        // home: HomeScreen(),

        routes: {
    '/home': (_) => HomeScreen(),
    // '/history': (_) => HistoryScreen(),
    // '/leave': (_) => LeaveScreen(),
    '/profile': (_) => ProfileScreen(),
  },
  // initialRoute: '/home',
      ),
    );
  }
}

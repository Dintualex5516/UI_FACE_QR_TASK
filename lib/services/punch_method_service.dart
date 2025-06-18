import 'package:shared_preferences/shared_preferences.dart';

Future<void> savePunchInMethod(String method) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('punchInMethod', method);
}

Future<String?> getPunchInMethod() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('punchInMethod');
}

Future<void> clearPunchInMethod() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('punchInMethod');
}

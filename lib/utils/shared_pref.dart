import 'package:shared_preferences/shared_preferences.dart';

String _token = 'token';

class SharedPref {
  static void saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_token, token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(_token);
    return token;
  }
}

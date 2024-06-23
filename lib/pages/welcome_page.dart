import 'package:flutter/material.dart';
import 'package:test_telkomsat2/pages/home_page.dart';
import 'package:test_telkomsat2/pages/login_page.dart';
import 'package:test_telkomsat2/utils/shared_pref.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void checkUser() async {
    await Future.delayed(const Duration(seconds: 3));
    String? token = await SharedPref.getToken();

    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.access_alarm,
          size: 60,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/pages/home_page.dart';
import 'package:test_telkomsat2/providers/login_provider.dart';
import 'package:test_telkomsat2/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    void validasiForm() {
      if (userNameController.text.isEmpty || passController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Masukkan username dan password"),
          ),
        );
      } else if (loginProvider.nameError != null ||
          loginProvider.passwordError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Terdapat kesalahan pada form"),
          ),
        );
      } else {
        loginProvider
            .login(userNameController.text, passController.text, context)
            .then(
          (_) {
            if (!loginProvider.isError) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text("Periksa kembali username dan password anda"),
                ),
              );
            }
          },
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldWidget(
                onChanged: (query) {
                  loginProvider.validateName(query);
                },
                errorText: loginProvider.nameError,
                controller: userNameController,
                labelText: "Username",
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                onChanged: (query) {
                  loginProvider.validatePassword(query);
                },
                obscureText: loginProvider.isObsecure,
                errorText: loginProvider.passwordError,
                controller: passController,
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    loginProvider.obsecure();
                  },
                  icon: loginProvider.isObsecure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: validasiForm,
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

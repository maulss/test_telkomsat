import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).getCurrentUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: userProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : userProvider.error != null
              ? Center(
                  child: TextWidget(
                    text: "${userProvider.error}",
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                            radius: 40,
                            child: userProvider.userData?.image != null
                                ? Image.network(
                                    "${userProvider.userData?.image}",
                                    fit: BoxFit.cover,
                                  )
                                : Icon(Icons.person)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                          text:
                              "Username : ${userProvider.userData?.username}"),
                      const SizedBox(
                        height: 16,
                      ),
                      TextWidget(
                          text: "Email : ${userProvider.userData?.email}"),
                      const SizedBox(
                        height: 16,
                      ),
                      TextWidget(
                          text: "Gender : ${userProvider.userData?.gender}"),
                      const SizedBox(
                        height: 16,
                      ),
                      TextWidget(
                        text:
                            "Birth Date : ${userProvider.userData?.birthDate}",
                      )
                    ],
                  ),
                ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}

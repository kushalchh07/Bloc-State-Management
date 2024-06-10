import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:push_notification/API/firebase_api.dart';
import 'package:push_notification/login%20and%20SignUp/login.dart';
import 'package:push_notification/services/firebase_auth_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    FirebaseApi.getDeviceToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthService.logout();
                // Navigator.pushReplacementNamed(context, "/login");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
      ),
    );
  }
}

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:push_notification/API/firebase_api.dart';
import 'package:push_notification/Notification/notification_page.dart';
import 'package:push_notification/bloc/bloc/login_bloc.dart';
import 'package:push_notification/home/home.dart';
import 'package:push_notification/login%20and%20SignUp/login.dart';
import 'package:push_notification/login%20and%20SignUp/signup.dart';
import 'package:push_notification/services/checkUser.dart';

import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future _firebaeBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some Notifications Received in Background");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Initiallize firebase messaging

  await FirebaseApi.init();
  // initialize local notifications
  await FirebaseApi.localNotiInit();
  // Listen to backgrouund Notifications
  FirebaseMessaging.onBackgroundMessage(_firebaeBackgroundMessage);

  //onbackground notifications tapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("BackGround Notification tapped");
      navigatorKey.currentState!
          .pushNamed("/notificationpage", arguments: message);
    }
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    if (message.notification != null) {
      FirebaseApi.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();

  if (message != null) {
    Future.delayed(Duration(seconds: 1), () {
      navigatorKey.currentState!
          .pushNamed("/notificationpage", arguments: message);
    });
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        routes: {
          "/login": (context) => LoginScreen(),
          "/home": (context) => Home(),
          "/signup": (context) => SignUpScreen(),
          "/checkUser": (context) => CheckUser(),
          "/notificationpage": (context) => NotificationPage(),
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Map paylod = {};
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;

    //for background and terminated state
    if (data is RemoteMessage) {
      paylod = data.data;
    }
//for foreground state
    if (data is NotificationResponse) {
      paylod = jsonDecode(data.payload!);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        child: Text("$data"),
      ),
    );
  }
}

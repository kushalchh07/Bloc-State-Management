import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notification/main.dart';
import 'package:push_notification/services/crud_service.dart';
import 'package:push_notification/services/firebase_auth_service.dart';

class FirebaseApi {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //request notification permission
  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      carPlay: true,
      badge: true,
      sound: true,
      criticalAlert: true,
      provisional: true,
    );
  }

  static Future getDeviceToken() async {
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    bool isUserLoggedIn = await AuthService.isLoggedIn();

    if (isUserLoggedIn) {
      await CrudService.saveUserToken(fCMToken!);
      print("Token saved");
    }
    _firebaseMessaging.onTokenRefresh.listen((event) async {
      if (isUserLoggedIn) {
        await CrudService.saveUserToken(fCMToken!);
        print("Token saved");
      }
    });
  }

  // Future<void> initNotifications() async {
  //   await _firebaseMessaging.requestPermission();

  //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  // }
  static Future localNotiInit() async {
    //inititalize the plug in  app_icons needs to be added as a drawable resourse
    const AndroidInitializationSettings initializationSettingsAndriod =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndriod);

    //request notification permission for andriod 13 or above
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap,
        onDidReceiveNotificationResponse: onNotificationTap);
  }
  //on

  static void onNotificationTap(NotificationResponse notificationresponse) {
    navigatorKey.currentState!
        .pushNamed("/notificationpage", arguments: notificationresponse);
  }
  //on tap local notification in foreground
  //show simple notification

  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channel id", 'channel name',
            channelDescription: 'Channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {}

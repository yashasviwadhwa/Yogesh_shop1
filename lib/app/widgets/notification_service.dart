import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void notificationPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      provisional: true,
      criticalAlert: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("Logger:- 1 ${settings.authorizationStatus}");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint("Logger:- 2 ${settings.authorizationStatus}");
    } else {
      debugPrint("Logger:- 3 ${settings.authorizationStatus}");
    }
  }

  static void initLocalNotification(RemoteMessage message) async {
    var androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var darwinInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    debugPrint("Logger:- Payload- Start");
    await _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          debugPrint("Logger:- Payload- $payload");
        });
    debugPrint("Logger:- Payload- End");
  }

  static void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint(
          "Logger:- firebaseInit = ${message.notification?.title ?? ''} data ${message.data.toString()}");
      if (Platform.isAndroid) {
        initLocalNotification(message);
        showNotification(message);
      } else {
        showNotification(message);
      }
    });
  }

  static void setUpInteractMessage() async {

    ///When app is terminate
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();

    if(message != null) {
      debugPrint("Logger:- setUpInteractMessage- terminate ${message.data.toString()}");
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint("Logger:- setUpInteractMessage- ${event.data.toString()}");
    });
  }

  static void showNotification(RemoteMessage message) {
    var androidNotificationChannel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      'High Importance Notifications',
      importance: Importance.max,
    );

    var androidNotificationDetails = AndroidNotificationDetails(
      androidNotificationChannel.id,
      androidNotificationChannel.name,
      importance: Importance.high,
      priority: Priority.high,
      channelDescription: 'Your channel description',
      ticker: 'Ticker',
    );
    var darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    _notificationsPlugin.show(
      0,
      message.notification?.title ?? "",
      message.notification?.body ?? '',
      notificationDetails,
    );
  }

  static Future<String> getDeviceToken() async {
    String token = await _messaging.getToken() ?? refreshToken();
    debugPrint("Logger:- Token $token");
    return token;
  }

  static String refreshToken() {
    String token = '';
    _messaging.onTokenRefresh.listen((event) {
      token = event.toString();
    });
    return token;
  }

  static void navigate() {

  }

}

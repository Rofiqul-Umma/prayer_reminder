import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Channel IDs
  static const String channelId = 'prayer_channel_id';
  static const String channelName = 'Prayer Notifications';
  static const String channelDescription = 'Channel for prayer reminders';

  // Initialize notification service
  Future<void> init() async {
    try {
      // Set up platform-specific settings
      final AndroidInitializationSettings androidInitSettings =
          AndroidInitializationSettings("@mipmap/ic_launcher");

      final DarwinInitializationSettings iosInitSettings =
          DarwinInitializationSettings(
            requestAlertPermission: false, // We'll request later
            requestBadgePermission: false, // We'll request later
            requestSoundPermission: false, // We'll request later
          );

      final InitializationSettings initSettings = InitializationSettings(
        android: androidInitSettings,
        iOS: iosInitSettings,
      );

      // Initialize the plugin
      await flutterLocalNotificationsPlugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          debugPrint("Notification tapped: \\${response.payload}");
          // Handle notification tapped logic here
        },
      );

      // Create notification channel for Android (required for Android 8.0+)
      if (Platform.isAndroid) {
        await _setupAndroidNotificationChannel();
        // Request notification permission for Android 13+
        if (await _isAndroid13orAbove()) {
          await _requestAndroidNotificationPermission();
        }
      }

      // Request permissions after initialization
      if (Platform.isIOS) {
        await _requestIOSPermissions();
      }

      debugPrint("Notification service initialized successfully");
    } catch (e) {
      debugPrint("Error initializing notification service: $e");
    }
  }

  Future<bool> _isAndroid13orAbove() async {
    // Android 13 is API level 33
    // permission_handler provides Platform.isAndroid and version check
    return Platform.isAndroid &&
        (await Permission.notification.isDenied ||
            await Permission.notification.isGranted);
  }

  Future<void> _requestAndroidNotificationPermission() async {
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }

  // Set up Android notification channel (required for Android 8.0+)
  Future<void> _setupAndroidNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: channelDescription,
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  // Request iOS permissions
  Future<void> _requestIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  // Show a simple notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            color: Colors.white,
            channelId,
            channelName,
            channelDescription: channelDescription,
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
            enableVibration: true,
            playSound: true,
            icon: "@mipmap/ic_launcher",
          );

      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails,
        payload: payload,
      );

      debugPrint("Notification sent: $title");
    } catch (e) {
      debugPrint("Error showing notification: $e");
    }
  }

  // Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

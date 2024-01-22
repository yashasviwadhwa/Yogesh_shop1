import 'package:e_shop/app/utils/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'app/network/api_client.dart';
import 'app/network/dio/dio_api_client.dart';
import 'app/network/internet_check.dart';
import 'app/routes/app_pages.dart';
import 'app/widgets/notification_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint(
      "aa _messageReceived start:_____________________________________________________________________");
  debugPrint("aa BackgroundHandler message.data:${message.data}");
  debugPrint(
      "aa BackgroundHandler message.notification:${message.notification!.title}");
  debugPrint(
      "aa BackgroundHandler message.notification:${message.notification!.body}");
  debugPrint(
      "aa _messageReceived end:_____________________________________________________________________");

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  debugPrint('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAK8bhEWVO2VZBNtm8K5lyOIF-K_F5AShk",
      appId: "1:56327012114:android:901bcf1d0916a5fcfdfdcb",
      messagingSenderId: "56327012114",
      projectId: "yash-project-2ecc0",
    ),
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  NotificationService.notificationPermission();
  NotificationService.firebaseInit();
  NotificationService.setUpInteractMessage();
  NotificationService.getDeviceToken();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  Get.lazyPut(
        () => NetworkConnectivity(),
    fenix: true,
  );

  Get.lazyPut<ApiClient>(
        () => DioApiClient(),
    fenix: true,
  );


  runApp(const MyApp());
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black54,
        overlayWidget:  const Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: AppColor.color0E101B,
          ),
        ),
      child: ScreenUtilInit(
        designSize:   const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        },
      ),
    );
  }
}

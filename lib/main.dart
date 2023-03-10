import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/screens/pages/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); 
       await GetStorage.init();// await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

import 'package:feature_list_demo/navigation/navigation_home.dart';
import 'package:feature_list_demo/utils/storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //初始化存储管理
  await StorageManager.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feature List Demo',
      home: NavigationHomePage(),
    );
  }
}

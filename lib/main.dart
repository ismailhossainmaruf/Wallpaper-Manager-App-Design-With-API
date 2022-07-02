import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/pages/instaview.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/provider/home_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (_)=>HomeProvider())
      ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstagramView(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_app/screens/bottom_bar.dart';
import 'package:my_app/utils/app_layout.dart';
import 'package:my_app/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* at least have one "MaterialApp" */
    return MaterialApp(
      title: 'Flutter Demo',
      /* omitted debug banner in top right corner */
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primary),
      /* make a custom class, "BottomBar", to render a display */
      home: const BottomBar(),
    );
  }
}

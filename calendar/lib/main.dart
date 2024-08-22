import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calendar/inject_dependencies.dart';
import 'package:calendar/routes/pages.dart';
void main() async{
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: Pages.allPages,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_test/bindings/initial_bindings.dart';
import 'package:tech_test/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tech Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: InitialBindings(),
      initialRoute: '/',
      getPages: routes,
    );
  }
}

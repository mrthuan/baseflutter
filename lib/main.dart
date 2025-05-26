import 'package:flutter/material.dart';
import 'package:untitled1/screens/CreateStep1Screen.dart';
import 'package:untitled1/screens/MainScreen.dart';
import 'screens/welcome_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),      // màn hình chào
        '/main': (context) => MainScreen(),           // màn chính
        '/create': (context) => CreateStep1Screen(),  // bước đầu tạo ảnh
      },
    );
  }
}

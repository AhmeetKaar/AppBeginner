import 'package:beginnerapp/DI/di_create.dart';
import 'package:beginnerapp/page/first_page.dart';
import 'package:beginnerapp/app.dart';
import 'package:beginnerapp/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  await ApiService();
  FlutterNativeSplash.remove();
  setup();
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'API'),
    );
  }
}

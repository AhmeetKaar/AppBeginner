import 'package:beginnerapp/DI/di_create.dart';
import 'package:beginnerapp/screen/launch_screen.dart';
import 'package:beginnerapp/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:beginnerapp/service/api_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );
  final loadData = ApiService();
  try {
    await loadData.apiFollowing();
    setup();
    FlutterNativeSplash.remove();
  } catch (e) {
    throw Exception("ERROR: data could not be loaded");
  }
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'API'),
    );
  }
}

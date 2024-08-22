import 'package:beginnerapp/DI/di_create.dart';
import 'package:beginnerapp/model/followers_model.dart';
import 'package:beginnerapp/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:beginnerapp/service/api_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );
  setup();

  List<FollowersModel>? fetchedFollowers;
  try {
    final ApiService apiService = getIt.get<ApiService>();
    fetchedFollowers = await apiService.apiFollowing();
    FlutterNativeSplash.remove();
  } catch (e) {
    throw Exception("ERROR: data could not be loaded");
  }
  runApp(App(loadingData: fetchedFollowers));
}

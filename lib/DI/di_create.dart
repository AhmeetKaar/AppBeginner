import 'package:beginnerapp/service/api_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<ApiService>(ApiService());  
}

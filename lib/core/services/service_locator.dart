import 'package:get_it/get_it.dart';
import 'package:grady/core/database/cache/chash_helper.dart';
final GetIt getIt = GetIt.instance;
void setupServiceLocator(){
  // take obj from cache helper
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
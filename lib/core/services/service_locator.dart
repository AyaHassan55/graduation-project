import 'package:get_it/get_it.dart';
import 'package:grady/bussinesLogic/cubit/auth_cubit/auth_cubit.dart';
import 'package:grady/core/database/cache/chash_helper.dart';
final GetIt getIt = GetIt.instance;
void setupServiceLocator(){
  // take obj from cache helper
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
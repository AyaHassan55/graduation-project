import 'package:shared_preferences/shared_preferences.dart';
class CacheData{
  late SharedPreferences sharedPreferences;
  void cacheInit() async{
    sharedPreferences=await SharedPreferences.getInstance();

  }
  Future <bool> setData({required String key,required bool value}) async{
  await sharedPreferences.setBool(key, value);
    return true;
  }
}
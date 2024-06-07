import 'package:shared_preferences/shared_preferences.dart';
import '../values/app_constant.dart';

class SharedPrefsManager{
  static Future<void> setToken(String token)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(AppConstant.memoryToken, token);
    } catch (e) {
      print('The Error is:$e');
    }
    print('Token Saved');
  }

  static Future<String> getToken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstant.memoryToken)??'';
  }
}
import 'dart:convert';
import 'package:i12_into_012/models/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _key = 'app_state';

  Future<void> saveAppState(AppState state) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(state.toJason());
    await prefs.setString(_key, json);
  }

  Future<AppState?> loadAppState() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return null;
    return AppState.fromJason(jsonDecode(json) as Map<String, dynamic>);
  }
}

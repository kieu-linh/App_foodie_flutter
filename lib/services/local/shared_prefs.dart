import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final String avatarKey = 'avatar';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getAvatarPath() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(avatarKey);
  }

  Future<void> saveAvatarPath(String avatar) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(avatarKey, avatar);
  }
}

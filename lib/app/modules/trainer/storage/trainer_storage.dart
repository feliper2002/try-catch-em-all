import 'package:shared_preferences/shared_preferences.dart';

abstract class TrainerStorageContract {
  Future recordID(String id);
  Future clear();
}

class TrainerStorage implements TrainerStorageContract {
  late SharedPreferences prefs;

  _initStorage() async {
    prefs = await SharedPreferences.getInstance();
  }

  TrainerStorage() {
    _initStorage();
  }

  @override
  Future clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future recordID(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id);
  }

  Future<String> get id async {
    final prefs = await SharedPreferences.getInstance();
    final _id = prefs.getString('id') ?? "";

    return _id;
  }

  Future<bool> trainerExists() async {
    final _id = await id;
    return _id.isNotEmpty;
  }
}

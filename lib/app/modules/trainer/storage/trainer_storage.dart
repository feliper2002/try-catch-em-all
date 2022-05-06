import 'package:shared_preferences/shared_preferences.dart';

abstract class TrainerStorageContract {
  Future recordID(String id);
  Future clear();
  Future<String> get id;
  Future<bool> trainerExists();
}

class TrainerStorage implements TrainerStorageContract {
  late SharedPreferences prefs;

  Future<SharedPreferences> _initStorage() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
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

  @override
  Future<String> get id async {
    final prefs = await SharedPreferences.getInstance();
    final _id = prefs.getString('id') ?? "";

    return _id;
  }

  @override
  Future<bool> trainerExists() async {
    final _id = await id;
    // clear();
    return _id.isNotEmpty;
  }
}

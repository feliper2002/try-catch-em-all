import 'package:shared_preferences/shared_preferences.dart';

abstract class TrainerStorageContract {
  Future recordID(String id);
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
  Future recordID(String id) async {
    await prefs.setString('id', id);
  }

  Future<String> get id async {
    final _id = prefs.getString('id') ?? "";

    return _id;
  }
}

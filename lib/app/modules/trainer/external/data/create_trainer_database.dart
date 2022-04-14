import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/create_trainer_database_contract.dart';

class CreateTrainerDatabase implements CreateTrainerDatabaseContract {
  CreateTrainerDatabase(this.connect);

  final HasuraConnect connect;

  @override
  Future<void> createTrainer(
      String name, int age, String gender, String region) async {
    var mutation = '''
    mutation CreateTrainer {
  insert_trainers(objects: {name: $name, age: $age, gender: $gender, region: $region}) {
    affected_rows
    returning {
      id
      name
      gender
      age
      region
      created_at
    }
  }
}
''';
    await connect.mutation(mutation);
  }
}

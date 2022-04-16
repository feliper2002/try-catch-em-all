import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/delete_trainer_database_contract.dart';

class DeleteTrainerDatabase implements DeleteTrainerDatabaseContract {
  final HasuraConnect connect;

  DeleteTrainerDatabase(this.connect);

  @override
  Future<void> deleteTrainer(String id) async {
    var mutation = '''
mutation DeleteTrainer {
  delete_trainers_by_pk(id: $id) {
    name
  }
}
''';

    try {
      await connect.mutation(mutation);
    } on HasuraError catch (_) {
      throw DatabaseHasuraConnectionError(
          "Não foi possível se conectar com o Hasura.");
    } catch (_) {
      throw DatabaseConnectionError("Erro ao se conectar à Database.");
    }
  }
}

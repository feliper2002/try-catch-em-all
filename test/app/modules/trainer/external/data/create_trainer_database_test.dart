import 'package:flutter_test/flutter_test.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/data/create_trainer_database.dart';

class HasuraMock extends Mock implements HasuraConnect {}

void main() {
  late HasuraMock hasura;
  late CreateTrainerDatabase database;

  setUpAll(() {
    hasura = HasuraMock();
    database = CreateTrainerDatabase(hasura);
  });

  test('Should create a trainer with Hasura mutation', () async {
    when(() => hasura.mutation(_mutation)).thenAnswer((_) async => dynamic);

    final response =
        await database.createTrainer("Kotori", 20, "Male", "Sinnoh");

    verify(() => response);
  });
}

var _mutation =
    '''
    mutation CreateTrainer {
  insert_trainers(objects: {name: Kotori, age: ${20}, gender: Male, region: Sinnoh) {
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

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class TrainerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            HasuraConnect("https://try-catch-em-all.herokuapp.com/v1/graphql")),
      ];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (_, args) => const PokedexList()),
      ];
}

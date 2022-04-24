import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/widgets/trainer_builder.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  final controller = Modular.get<TrainerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TrainerBuilder(
        controller: controller,
        onLoading: () {
          return const Loader();
        },
        onError: (message) {},
        onSuccess: (trainer) {},
      ),
    );
  }
}

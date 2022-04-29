import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class CreateTrainerPage extends StatelessWidget {
  CreateTrainerPage({Key? key}) : super(key: key);

  final controller = Modular.get<TrainerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, child) {
            child = SizedBox(
              child: Column(
                children: [
                  const Text("Digite seu nome de treinador:"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFormField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome de treinador',
                        hintText: '(Ex: Ash)',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 170),
                    child: TextFormField(
                      controller: controller.ageController,
                      maxLines: 1,
                      maxLength: 3,
                      decoration: const InputDecoration(
                        labelText: 'Idade',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.createTrainer(
                          controller.nameController.value.text,
                          NumberFormat()
                              .parse(controller.ageController.value.text)
                              .toInt(),
                          "gender",
                          "region");
                    },
                    child: const Text("Concluir"),
                  ),
                ],
              ),
            );

            if (state is LoadingTrainerState) {
              child = const Loader();
            }
            if (state is ErrorTrainerState) {
              child = Center(
                child: Text(state.message),
              );
            }

            if (state is SuccessActionTrainerState) {
              Modular.to.navigate('/');
            }

            return child;
          }),
    );
  }
}

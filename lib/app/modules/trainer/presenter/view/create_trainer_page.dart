import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';
import 'package:try_catch_em_all/utils/widgets/custom_button.dart';
import 'package:try_catch_em_all/utils/widgets/custom_input.dart';
import 'package:try_catch_em_all/utils/widgets/custom_item_select.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class CreateTrainerPage extends StatelessWidget {
  CreateTrainerPage({Key? key}) : super(key: key);

  final controller = Modular.get<TrainerController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, child) {
            child = SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Digite seu nome de treinador:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * .35, left: size.width * .07),
                    child: CustomInput(
                      controller: controller.nameController,
                      labelText: 'Nome de treinador',
                      hintText: '(Ex: Ash)',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * .65, left: size.width * .07),
                    child: CustomInput(
                      controller: controller.ageController,
                      labelText: 'Idade',
                      maxLength: 3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomItemSelect(
                    values: const ["Masculino", "Feminino"],
                    controller: controller.genderController,
                  ),
                  const SizedBox(height: 10),
                  CustomItemSelect(
                    values: const [
                      "Kanto",
                      "Johto",
                      "Hoenn",
                      "Sinnoh",
                      "Unova",
                      "Kalos",
                      "Alola",
                      "Galar"
                    ],
                    controller: controller.regionController,
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    onPressed: () async {
                      await controller.createTrainer(
                        controller.nameController.value.text,
                        controller.ageController.value.text,
                        controller.genderController.value.text,
                        controller.regionController.value.text,
                      );
                    },
                    child: const Text(
                      "Concluir",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
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

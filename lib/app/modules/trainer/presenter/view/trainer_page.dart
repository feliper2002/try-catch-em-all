import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';
import 'package:try_catch_em_all/utils/themes/app_colors.dart';
import 'package:try_catch_em_all/utils/themes/app_styles.dart';
import 'package:try_catch_em_all/utils/widgets/back_button.dart';
import 'package:try_catch_em_all/utils/widgets/custom_button.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  final controller = Modular.get<TrainerController>();

  @override
  void initState() {
    controller.getTrainer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.darkRed),
              ),
              onPressed: () async {
                Modular.to.pushNamed('/party');
              },
              child: Row(
                children: const [
                  Icon(Icons.computer, color: Colors.white),
                  SizedBox(width: 5),
                  Text("Party"),
                ],
              ),
            ),
          ),
        ],
        leading: const BackBtnIcon(),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is LoadingTrainerState) {
            return const Loader();
          }
          if (value is ErrorTrainerState) {
            return Center(
              child: Text(value.message),
            );
          }
          if (value is SuccessTrainerState) {
            final trainer = value.trainer;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Informações pessoais:",
                              style: AppStyles.profileInfo.copyWith(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(height: 12),
                          Text("Nome: " + trainer.name,
                              style: AppStyles.profileInfo),
                          Text("Gênero: " + trainer.gender,
                              style: AppStyles.profileInfo),
                          Text("Região: " + trainer.region,
                              style: AppStyles.profileInfo),
                          Visibility(
                            visible: trainer.age > 0,
                            child: Text("Idade: " + trainer.age.toString(),
                                style: AppStyles.profileInfo),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Pokédex: ${trainer.pokemons.length}",
                              style: AppStyles.profileInfo),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () async {
                    await controller.deleteTrainer();
                    Modular.to.navigate("/trainer/create");
                  },
                  child: Text(
                    (trainer.gender == "Masculino")
                        ? "Deletar Treinador"
                        : "Deletar Treinadora",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            );
          }
          return const Loader();
        },
      ),
    );
  }
}

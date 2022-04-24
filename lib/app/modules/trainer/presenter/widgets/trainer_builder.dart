import 'package:flutter/material.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/models/trainer_model.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

class TrainerBuilder extends StatefulWidget {
  final TrainerController controller;
  final Widget? Function(TrainerModel trainer)? onSuccess;
  final Widget? Function()? onLoading;
  final Widget? Function(String? message)? onError;

  const TrainerBuilder({
    Key? key,
    required this.controller,
    this.onSuccess,
    this.onLoading,
    this.onError,
  }) : super(key: key);

  @override
  State<TrainerBuilder> createState() => _TrainerBuilderState();
}

class _TrainerBuilderState extends State<TrainerBuilder> {
  @override
  void initState() {
    widget.controller.getTrainer("id");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        if (value is LoadingTrainerState) {
          child = widget.onLoading!.call();
        }
        if (value is ErrorTrainerState) {
          child = widget.onError!.call(value.message);
        }
        if (value is SuccessTrainerState) {
          child = widget.onSuccess!.call(value.trainer);
        }

        return child ?? Container();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/core/app_module.dart';
import 'package:try_catch_em_all/app/core/app_widget.dart';
import 'package:uno/uno.dart';

void main() => runApp(ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ));

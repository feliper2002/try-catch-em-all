import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon.dart';
import 'package:try_catch_em_all/utils/functions/caps_lock_index.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonTile({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Modular.to.pushNamed('/info', arguments: {
          'url': pokemon.url,
          'id': (pokemon.number).toString(),
          'name': pokemon.name,
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red[700],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset("assets/images/flat-pokeball.png", scale: 18),
            const SizedBox(width: 6),
            Text(
              (pokemon.number).toString().padLeft(3, '0') +
                  " " +
                  capsLock(pokemon.name!),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
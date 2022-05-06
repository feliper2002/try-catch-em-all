import 'package:flutter/material.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/widgets/pokemon_type_tag/type_tag_color.dart';
import 'package:try_catch_em_all/utils/functions/caps_lock_index.dart';

class _Tag extends StatelessWidget {
  final Color color;
  final String text;
  final Offset size;
  const _Tag(
      {Key? key, required this.color, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

class PokemonTypeTag extends StatelessWidget {
  final List<String?>? types;
  const PokemonTypeTag({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _tagSize = Offset(size.height * .03, size.width * .5);
    return SizedBox(
      height: _tagSize.dx,
      width: _tagSize.dy,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: types!.length,
        itemBuilder: (_, index) {
          final type = types![index];
          return _Tag(
            color: TypeColor.get(type!),
            text: capsLock(type),
            size: _tagSize,
          );
        },
      ),
    );
  }
}

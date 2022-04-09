import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class TypeColor {
  static Color get(String type) {
    switch (type) {
      case "fire":
        return const Color(0xffEE8130);
      case "water":
        return const Color(0xff6390F0);
      case "grass":
        return const Color(0xff7AC74C);
      case "flying":
        return const Color(0xffA98FF3);
      case "ice":
        return const Color(0xff96D9D6);
      case "ghost":
        return const Color(0xff735797);
      case "ground":
        return const Color(0xffE2BF65);
      case "dark":
        return const Color(0xff705746);
      case "fairy":
        return const Color(0xffD685AD);
      case "rock":
        return const Color(0xffB6A136);
      case "dragon":
        return const Color(0xff6F35FC);
      case "normal":
        return const Color(0xffA8A77A);
      case "poison":
        return const Color(0xffA33EA1);
      case "steel":
        return const Color(0xffB7B7CE);
      case "bug":
        return const Color(0xffA6B91A);
      case "fighting":
        return const Color(0xffC22E28);
      case "psychic":
        return const Color(0xffF95587);
      case "electric":
        return const Color(0xffF7D02C);
      default:
        return const Color(0xffEE8130);
    }
  }
}

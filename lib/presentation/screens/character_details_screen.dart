// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';

import '../../data/models/characters_model.dart';
import '../widgets/character_info.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CharacterInfo(character: character);
  }
}

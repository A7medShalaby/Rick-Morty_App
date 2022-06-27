import 'package:rick_and_morty_app/data/models/characters_model.dart';

import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<List<Results>> fetchData() async {
    final listOfCharacters = await charactersWebServices.getAllCharacters();
    return listOfCharacters
        .map((character) => Results.fromJson(character))
        .toList();
  }
}

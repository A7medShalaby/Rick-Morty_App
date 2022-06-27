import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/data/models/characters_model.dart';

import '../../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  // ignore: unused_field
  final CharactersRepository charactersRepository;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void fetchDataOfRepository() async {
    charactersRepository.fetchData().then((listOfCharacters) {
      emit(DataLoaded(listOfCharacters));
    });
    //return characters;
  }
}

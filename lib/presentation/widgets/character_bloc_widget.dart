// ignore_for_file: must_be_immutable, unused_field, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rick_and_morty_app/presentation/widgets/character_item.dart';
import 'package:rick_and_morty_app/presentation/widgets/loading_indicator.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../data/models/characters_model.dart';

class CharacterBlocWidget extends StatefulWidget {
  const CharacterBlocWidget({Key? key}) : super(key: key);

  @override
  State<CharacterBlocWidget> createState() => _CharacterBlocWidgetState();
}

class _CharacterBlocWidgetState extends State<CharacterBlocWidget> {
  late List<Results> allCharacters;
  late List<Results> searchingForCharacter;
  late final bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).fetchDataOfRepository();
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(76, 139, 120, 137),
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchingForCharacter.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: CharacterItem(
              character: _searchTextController.text.isEmpty
                  ? allCharacters[index]
                  : searchingForCharacter[index],
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is DataLoaded) {
          allCharacters = (state).data;
          return buildLoadedListWidgets();
        } else {
          return LoadingIndicator();
        }
      },
    );
  }
}

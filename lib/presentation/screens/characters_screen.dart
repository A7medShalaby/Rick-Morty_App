// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import '../../data/models/characters_model.dart';
import '../widgets/character_bloc_widget.dart';

class CharactersScreen extends StatefulWidget {
  CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Results> allCharacters;
  late List<Results> searchingForCharacter;
  late bool _isSearching = false;
  final _searchTextController = TextEditingController();

  void addingSearchedCharacterToSearchedList(String searchedCharacter) {
    searchingForCharacter = allCharacters
        .where((element) =>
            element.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    //TODO: A Lazmit El SetState Hena ?!
    setState(() {});
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchTextController.clear();
    });
  }

  List<IconButton> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearchQuery();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.secondColor,
            size: 30,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(
            Icons.search,
            color: MyColors.secondColor,
            size: 30,
          ),
        ),
      ];
    }
  }

  TextField _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.deepPurple,
      decoration: const InputDecoration(
        hintText: "Find A Character...",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.secondColor,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: MyColors.secondColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (searchedCharacter) {
        addingSearchedCharacterToSearchedList(searchedCharacter);
      },
    );
  }

  Text _buildAppBarTitle() {
    return const Text(
      'Rick And Morty',
      style: TextStyle(
        color: MyColors.secondColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.firstColor,
        elevation: 0.5,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        centerTitle: true,
        leading: _isSearching
            ? const BackButton(color: MyColors.secondColor)
            : Container(),
        actions: _buildAppBarActions(),
      ),
      body: CharacterBlocWidget(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../data/models/characters_model.dart';

class CharacterInfo extends StatelessWidget {
  final Results character;
  const CharacterInfo({Key? key, required this.character}) : super(key: key);

  SliverAppBar buildCharacterSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.grayColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: MyColors.blackColor,
            fontSize: 24,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  RichText characterTextDescription(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.firstColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Divider buildDividerLine(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.deepPurple,
      thickness: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayColor,
      body: CustomScrollView(
        slivers: [
          buildCharacterSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterTextDescription('Name : ', character.name),
                      buildDividerLine(325),
                      characterTextDescription('Gender : ', character.gender),
                      buildDividerLine(315),
                      characterTextDescription('Status : ', character.status),
                      buildDividerLine(320),
                      characterTextDescription('Species : ', character.species),
                      buildDividerLine(308),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 545,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

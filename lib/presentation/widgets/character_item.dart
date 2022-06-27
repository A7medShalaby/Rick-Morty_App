import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/constants/strings.dart';
import '../../constants/strings.dart';
import '../../data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  final Results character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  Container characterItemFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.grayColor.withOpacity(0.6),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Text(
        character.name,
        style: const TextStyle(
          color: Colors.white,
          height: 1,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Hero characterItemPicture() {
    return Hero(
      tag: character.id,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(
            color: MyColors.grayColor.withOpacity(0.6),
            width: 3,
          ),
        ),
        child: character.image.isNotEmpty
            ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  //TODO: El Loading Pic Msh Bt7amel M3aya!
                  placeholder: 'assets/images/loading.gif',
                  image: character.image,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : Image.asset('assets/images/placeholder.png'),
      ),
    );
  }

  Container singleCharacterItem(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all(4),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ScreensRoute.characterDetailsScreen,
            arguments: character,
          );
        },
        child: GridTile(
          child: characterItemPicture(),
          footer: characterItemFooter(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return singleCharacterItem(context);
  }
}

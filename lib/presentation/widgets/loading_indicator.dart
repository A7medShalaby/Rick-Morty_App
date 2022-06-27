import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.firstColor,
      child: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/intro_loading.gif'),
          radius: 150,
        ),
      ),
    );
  }
}

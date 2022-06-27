import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(
    RickAndMortyApp(
      appRouter: AppRouter(),
    ),
  );
}

// ignore: use_key_in_widget_constructors
class RickAndMortyApp extends StatelessWidget {
  final AppRouter appRouter;
  const RickAndMortyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(199, 12, 221, 23),
        fontFamily: 'Quicksand',
      ),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

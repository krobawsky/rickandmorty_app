import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/domain/repositories/repositories.dart';
import 'package:rickandmorty_app/ui/cubits/character/character_cubit.dart';

import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CharacterRepository>(
            create: (context) => CharacterRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharacterCubit(
              RepositoryProvider.of<CharacterRepository>(context),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: 'RickAndMorty App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}

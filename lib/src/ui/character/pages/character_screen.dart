import 'package:rick_and_morty/src/domain/character/character.dart';
import 'package:rick_and_morty/src/core/core.dart';
import 'package:rick_and_morty/src/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/character_bloc.dart';
import '../widgets/character_content.dart';

class CharacterScreen extends StatelessWidget {
  final String id;

  const CharacterScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Character'),
      ),
      body: BlocProvider<CharacterBloc>(
        create: (_) => CharacterBloc(
          getCharacterUseCase: sl<GetCharacterUseCase>(),
        )..add(
            CharacterLoadEvent(id),
          ),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (BuildContext context, CharacterState state) {
            if (state is Loading) {
              return const LoadingWidget();
            } else if (state is Error) {
              return CustomErrorWidget(onTap: () => refresh(context));
            } else if (state is Success) {
              return CharacterContent(
                character: state.character,
              );
            } else {
              return CustomErrorWidget(onTap: () => refresh(context));
            }
          },
        ),
      ),
    );
  }

  void refresh(BuildContext context) async {
    context.read<CharacterBloc>().add(
          CharacterLoadEvent(id),
        );
  }
}

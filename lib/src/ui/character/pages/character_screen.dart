import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/core_ui/core_ui.dart';
import 'package:rick_and_morty/src/data/character/character.dart';
import 'package:rick_and_morty/src/domain/character/character.dart';

import 'package:rick_and_morty/src/ui/character/bloc/character_bloc.dart';
import 'package:rick_and_morty/src/ui/character/widgets/character_content.dart';

class CharacterScreen extends StatelessWidget {
  final String id;

  const CharacterScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const CharacterDI().setup(),
      builder: (context, _) {
        return BlocProvider<CharacterBloc>(
          create: (_) => CharacterBloc(
            getCharacterUseCase: Provider.of<GetCharacterUseCase>(context),
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
        );
      },
    );
  }

  Future refresh(BuildContext context) async {
    context.read<CharacterBloc>().add(
          CharacterLoadEvent(id),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/core_ui/core_ui.dart';
import 'package:rick_and_morty/src/data/characters/characters.dart';
import 'package:rick_and_morty/src/domain/characters/characters.dart';
import 'package:rick_and_morty/src/ui/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/src/ui/characters/widgets/characters_content.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const CharactersDI().setup(),
      builder: (context, _) {
        return BlocProvider<CharactersBloc>(
          create: (_) => CharactersBloc(
            getCharactersUseCase: Provider.of<GetCharactersUseCase>(context),
          )..add(
              CharactersLoadEvent(),
            ),
          child: BlocBuilder<CharactersBloc, CharactersState>(
            builder: (BuildContext context, CharactersState state) {
              if (state is Loading) {
                return const LoadingWidget();
              } else if (state is Error) {
                return CustomErrorWidget(
                  onTap: () => loadData(context),
                );
              } else if (state is Success) {
                return CharactersContent(
                  reachedMax: state.reachedMax,
                  characters: state.characters,
                  loadMoreData: () => loadData(context),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }

  Future loadData(BuildContext context) async {
    context.read<CharactersBloc>().add(
          CharactersLoadEvent(),
        );
  }
}

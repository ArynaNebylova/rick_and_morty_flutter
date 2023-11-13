import 'package:domain/domain.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/characters_bloc.dart';
import './characters_content.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Characters'),
      ),
      body: BlocProvider<CharactersBloc>(
        create: (_) => CharactersBloc(
          getCharactersUseCase: sl<GetCharactersUseCase>(),
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
              return Container();
            }
          },
        ),
      ),
    );
  }

  void loadData(BuildContext context) async {
    context.read<CharactersBloc>().add(
          CharactersLoadEvent(),
        );
  }
}

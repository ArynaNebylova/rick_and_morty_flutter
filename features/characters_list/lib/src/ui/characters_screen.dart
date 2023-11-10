import 'package:domain/domain.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/characters_bloc.dart';
import './characters_content.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CharactersScreen();
}

class _CharactersScreen extends State<CharactersScreen> {
  int page = 1;

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
            CharactersLoadEvent(page),
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
                characters: state.characters,
                loadMoreData: () => loadData(context),
              );
            } else {
              return CustomErrorWidget(
                onTap: () => loadData(context),
              );
            }
          },
        ),
      ),
    );
  }

  void loadData(BuildContext context) async {
    setState(
      () {
        page = page + 1;
      },
    );

    context.read<CharactersBloc>().add(
          CharactersLoadEvent(page),
        );
  }
}

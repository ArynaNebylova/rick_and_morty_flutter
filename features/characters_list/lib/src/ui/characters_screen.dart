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
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharactersBloc>(
      create: (_) => CharactersBloc(
        getCharactersUseCase: sl<GetCharactersUseCase>(),
      )..add(
          const CharactersLoadEvent(1),
        ),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (BuildContext context, CharactersState state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else if (state is Error) {
            return CustomErrorWidget(onTap: () => _refresh);
          } else if (state is Success) {
            return CharactersContent(characters: state.characters);
          } else {
            return CustomErrorWidget(onTap: () => _refresh);
          }
        },
      ),
    );
  }

  void _refresh(BuildContext context, int page) {
    context.read<CharactersBloc>().add(
          CharactersLoadEvent(page),
        );
  }
}

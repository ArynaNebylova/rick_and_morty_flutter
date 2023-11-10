import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/characters_bloc.dart';

class CharactersContent extends StatefulWidget {
  final List<CharactersEntity> characters;

  const CharactersContent({Key? key, required this.characters})
      : super(key: key);

  @override
  State<CharactersContent> createState() => _CharactersContent();
}

class _CharactersContent extends State<CharactersContent> {
  int page = 1;
  List<CharactersEntity> characters = [];

  @override
  void initState() {
    super.initState();
    characters = widget.characters;
  }

  void _loadMoreData(context, int page) {
    context.read<CharactersBloc>().add(
          CharactersLoadEvent(page),
        );
    setState(
      () {
        characters = widget.characters;
        page = page + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.extentAfter == 0) {
          _loadMoreData(context, page);
        }
        return false;
      },
      child: ListView.builder(
        itemCount: characters.length + 1,
        itemBuilder: (context, index) {
          if (index < characters.length) {
            return ListTile(
              title: Text(characters[index].name),
            );
          } else {
            return const Center(
              child: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}

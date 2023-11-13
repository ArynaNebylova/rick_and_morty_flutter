import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'widgets/character_widget.dart';

class CharactersContent extends StatelessWidget {
  final List<CharactersEntity> characters;
  final VoidCallback loadMoreData;
  final bool reachedMax;
  const CharactersContent(
      {super.key,
      required this.characters,
      required this.loadMoreData,
      required this.reachedMax});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            loadMoreData();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: reachedMax ? characters.length : characters.length + 1,
          itemBuilder: (context, index) {
            if (index < characters.length) {
              return CharacterWidget(
                character: characters[index],
              );
            } else {
              return const Center(
                child: LoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}

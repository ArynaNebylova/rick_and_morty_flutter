import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'character_widget.dart';

class CharactersContent extends StatelessWidget {
  final List<CharactersEntity> characters;
  final VoidCallback loadMoreData;
  const CharactersContent(
      {super.key, required this.characters, required this.loadMoreData});

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
          itemCount: characters.length,
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

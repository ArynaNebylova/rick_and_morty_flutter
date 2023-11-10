import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CharactersContent extends StatefulWidget {
  final List<CharactersEntity> characters;
  final VoidCallback loadMoreData;

  const CharactersContent(
      {Key? key, required this.characters, required this.loadMoreData})
      : super(key: key);

  @override
  State<CharactersContent> createState() => _CharactersContent();
}

class _CharactersContent extends State<CharactersContent> {
  List<CharactersEntity> characters = [];

  @override
  void initState() {
    super.initState();
    characters = widget.characters;
  }

  void _loadMoreData(BuildContext context) {
    widget.loadMoreData();
    setState(
      () {
        characters = [...characters, ...widget.characters];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            _loadMoreData(context);
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
      ),
    );
  }
}

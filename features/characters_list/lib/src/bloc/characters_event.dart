part of 'characters_bloc.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class CharactersLoadEvent extends CharactersEvent {
  final int page;
  const CharactersLoadEvent(this.page);
}

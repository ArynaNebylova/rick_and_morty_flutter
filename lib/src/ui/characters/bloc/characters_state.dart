part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

class Loading extends CharactersState {}

class Error extends CharactersState {}

class Success extends CharactersState {
  final List<SingleCharacterEntity> characters;
  final bool reachedMax;

  Success({required this.characters, required this.reachedMax});

  List<Object> get props => [characters];
}

part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class Loading extends CharactersState {}

class Error extends CharactersState {}

class Success extends CharactersState {
  final List<CharactersEntity> characters;

  const Success({required this.characters});

  @override
  List<Object> get props => [characters];
}

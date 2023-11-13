part of 'character_bloc.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

class Loading extends CharacterState {}

class Error extends CharacterState {}

class Success extends CharacterState {
  final CharacterEntity character;

  Success({required this.character});

  List<Object> get props => [character];
}

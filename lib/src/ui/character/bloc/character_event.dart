part of 'character_bloc.dart';

@immutable
sealed class CharacterEvent {}

class CharacterLoadEvent extends CharacterEvent {
  final String id;

  CharacterLoadEvent(this.id);
}

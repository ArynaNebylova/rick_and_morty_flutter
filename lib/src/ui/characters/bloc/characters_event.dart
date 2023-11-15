part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class CharactersLoadEvent extends CharactersEvent {}

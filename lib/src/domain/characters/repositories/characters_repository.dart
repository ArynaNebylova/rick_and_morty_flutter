part of '../characters.dart';

abstract class CharactersRepository {
  Future<CharactersEntity> getCharactersPerPage(int page);
}

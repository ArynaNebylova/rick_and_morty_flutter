import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:domain/domain.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUseCase getCharactersUseCase;
  bool isInitial = true;
  int? nextPage = 1;
  List<SingleCharacterEntity> charactersList = [];

  CharactersBloc({required this.getCharactersUseCase}) : super(Loading()) {
    on<CharactersLoadEvent>(
      (event, emit) async {
        await loadEvent(event, emit);
      },
    );
  }

  Future<void> loadEvent(CharactersLoadEvent event, Emitter emit) async {
    if (isInitial == true) {
      emit(
        Loading(),
      );
      isInitial = false;
    }

    try {
      var newCharactersData = await getCharactersUseCase.call(nextPage ?? 0);

      nextPage = newCharactersData.nextPage;
      charactersList = [...charactersList, ...newCharactersData.characters];

      newCharactersData.nextPage == null
          ? emit(
              Success(characters: charactersList, reachedMax: true),
            )
          : emit(
              Success(characters: charactersList, reachedMax: false),
            );
    } catch (_) {
      emit(
        Error(),
      );
    }
  }
}

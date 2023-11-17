import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rick_and_morty/src/domain/character/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacterUseCase getCharacterUseCase;
  CharacterBloc({required this.getCharacterUseCase}) : super(Loading()) {
    on<CharacterLoadEvent>(
      (event, emit) async {
        await loadEvent(event, emit);
      },
    );
  }
  Future<void> loadEvent(CharacterLoadEvent event, Emitter emit) async {
    emit(
      Loading(),
    );
    try {
      var character = await getCharacterUseCase.call(event.id);

      emit(
        Success(character: character),
      );
    } catch (_) {
      emit(
        Error(),
      );
    }
  }
}

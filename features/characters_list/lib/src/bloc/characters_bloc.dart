import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:domain/domain.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUseCase getCharactersUseCase;
  bool isInitial = true;
  CharactersBloc({required this.getCharactersUseCase}) : super(Loading()) {
    on<CharactersLoadEvent>(
      (event, emit) async {
        await loadEvent(event, emit);
      },
    );
  }

  Future<void> loadEvent(CharactersLoadEvent event, Emitter emit) async {
    emit(
      Loading(),
    );
    try {
      var characters = await getCharactersUseCase.call(event.page);
      emit(
        Success(characters: characters),
      );
    } catch (_) {
      emit(
        Error(),
      );
    }
  }
}

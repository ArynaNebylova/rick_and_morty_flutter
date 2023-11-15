import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rick_and_morty/src/domain/location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUseCase getLocationUseCase;
  LocationBloc({required this.getLocationUseCase}) : super(Loading()) {
    on<LocationLoadEvent>(
      (event, emit) async {
        await loadEvent(event, emit);
      },
    );
  }
  Future<void> loadEvent(LocationLoadEvent event, Emitter emit) async {
    emit(
      Loading(),
    );
    try {
      var location = await getLocationUseCase.call(event.id);

      emit(
        Success(location: location),
      );
    } catch (_) {
      emit(
        Error(),
      );
    }
  }
}

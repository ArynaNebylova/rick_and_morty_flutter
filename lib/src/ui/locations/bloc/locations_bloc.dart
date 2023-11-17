import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rick_and_morty/src/domain/locations/locations.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final GetLocationsUseCase getLocationsUseCase;
  bool isInitial = true;
  int? nextPage = 1;
  List<SingleLocationEntity> locationsList = [];

  LocationsBloc({required this.getLocationsUseCase}) : super(Loading()) {
    on<LocationsLoadEvent>(
      (event, emit) async {
        await loadEvent(event, emit);
      },
    );
  }

  Future<void> loadEvent(LocationsLoadEvent event, Emitter emit) async {
    if (isInitial == true) {
      emit(
        Loading(),
      );
      isInitial = false;
    }

    try {
      var newLocationsData = await getLocationsUseCase.call(nextPage ?? 0);

      nextPage = newLocationsData.nextPage;
      locationsList = [...locationsList, ...newLocationsData.locations];

      newLocationsData.nextPage == null
          ? emit(
              Success(locations: locationsList, reachedMax: true),
            )
          : emit(
              Success(locations: locationsList, reachedMax: false),
            );
    } catch (_) {
      emit(
        Error(),
      );
    }
  }
}

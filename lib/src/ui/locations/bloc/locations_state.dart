part of 'locations_bloc.dart';

@immutable
sealed class LocationsState {}

class Loading extends LocationsState {}

class Error extends LocationsState {}

class Success extends LocationsState {
  final List<SingleLocationEntity> locations;
  final bool reachedMax;

  Success({required this.locations, required this.reachedMax});

  List<Object> get props => [locations];
}

part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

class Loading extends LocationState {}

class Error extends LocationState {}

class Success extends LocationState {
  final LocationEntity location;

  Success({required this.location});

  List<Object> get props => [location];
}

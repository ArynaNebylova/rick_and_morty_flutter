part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

class LocationLoadEvent extends LocationEvent {
  final String id;

  LocationLoadEvent(this.id);
}

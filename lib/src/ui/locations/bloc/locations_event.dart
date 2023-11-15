part of 'locations_bloc.dart';

@immutable
sealed class LocationsEvent {}

class LocationsLoadEvent extends LocationsEvent {}

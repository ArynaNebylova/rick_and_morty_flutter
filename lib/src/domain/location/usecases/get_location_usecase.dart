part of '../location.dart';

class GetLocationUseCase {
  final LocationRepository repository;

  GetLocationUseCase({required this.repository});

  Future<LocationEntity> call(String id) {
    return repository.getLocation(id);
  }
}

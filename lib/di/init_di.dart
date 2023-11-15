import 'package:rick_and_morty/core/core.dart';
import 'package:rick_and_morty/features/character/data/data.dart';
import 'package:rick_and_morty/features/characters/data/data.dart';
import 'package:rick_and_morty/features/location/data/data.dart';
import 'package:rick_and_morty/features/locations/data/data.dart';

Future<void> init() async {
  coreDI.setup();
  characterDI.setup();
  charactersDI.setup();
  locationsDI.setup();
  locationDI.setup();
}

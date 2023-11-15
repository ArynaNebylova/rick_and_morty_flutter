import 'package:rick_and_morty/src/core/core.dart';

import '../characters/characters.dart';
import '../character/character.dart';
import '../location/location.dart';
import '../locations/locations.dart';

const DataDI dataDI = DataDI();

class DataDI extends DI {
  const DataDI();

  @override
  void setup() {
    charactersDI.setup();
    characterDI.setup();
    locationDI.setup();
    locationsDI.setup();
  }
}

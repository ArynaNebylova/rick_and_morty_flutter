import 'package:core/core.dart';

import '../characters/characters.dart';
import '../character/character.dart';

const DataDI dataDI = DataDI();

class DataDI extends DI {
  const DataDI();

  @override
  void setup() {
    charactersDI.setup();
    characterDI.setup();
  }
}

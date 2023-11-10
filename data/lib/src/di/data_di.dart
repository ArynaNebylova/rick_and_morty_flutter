import 'package:core/core.dart';

import '../characters/characters.dart';

const DataDI dataDI = DataDI();

class DataDI extends DI {
  const DataDI();

  @override
  void setup() {
    charactersDI.setup();
  }
}

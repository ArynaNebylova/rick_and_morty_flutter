import 'package:rick_and_morty/src/core/core.dart';
import 'package:rick_and_morty/src/data/data.dart';

Future<void> init() async {
  coreDI.setup();
  dataDI.setup();
}

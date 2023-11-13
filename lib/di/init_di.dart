import 'package:core/core.dart';
import 'package:data/data.dart';

Future<void> init() async {
  coreDI.setup();
  dataDI.setup();
}

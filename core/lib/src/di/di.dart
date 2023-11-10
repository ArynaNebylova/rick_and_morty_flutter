import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.I;

abstract class DI {
  const DI();

  void setup();
}

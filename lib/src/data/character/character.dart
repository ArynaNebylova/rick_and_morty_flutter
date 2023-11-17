library character;

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:rick_and_morty/src/core/core.dart';
import 'package:rick_and_morty/src/domain/character/character.dart' as domain;

part 'di/character_di.dart';

part 'models/character_model.dart';

part 'services/gql_service.dart';
part 'services/gql_service_impl.dart';

part 'repositories/character_repository_impl.dart';

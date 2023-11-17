library characters;

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:rick_and_morty/src/core/core.dart';
import 'package:rick_and_morty/src/domain/characters/characters.dart' as domain;

part 'di/characters_di.dart';

part 'models/characters_model.dart';
part 'models/single_character_model.dart';

part 'services/gql_service.dart';
part 'services/gql_service_impl.dart';

part 'repositories/characters_repository_impl.dart';

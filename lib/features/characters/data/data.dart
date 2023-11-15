library data;

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:rick_and_morty/core/core.dart';
import 'package:rick_and_morty/features/characters/domain/domain.dart'
    as domain;

part 'di/characters_di.dart';

part 'models/characters_model.dart';
part 'models/single_character_model.dart';

part 'services/gql_service.dart';
part 'services/gql_service_impl.dart';

part 'repositories/characters_repository_impl.dart';

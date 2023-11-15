library data;

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:rick_and_morty/core/core.dart';
import 'package:rick_and_morty/features/locations/domain/domain.dart' as domain;

part 'di/locations_di.dart';

part 'models/locations_model.dart';
part 'models/single_location_model.dart';

part 'services/gql_service.dart';
part 'services/gql_service_impl.dart';

part 'repositories/locations_repository_impl.dart';

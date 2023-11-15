import 'package:rick_and_morty/src/domain/locations/locations.dart';
import 'package:rick_and_morty/src/core/core.dart';
import 'package:rick_and_morty/src/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/locations_bloc.dart';
import '../widgets/locations_content.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Locations'),
      ),
      body: BlocProvider<LocationsBloc>(
        create: (_) => LocationsBloc(
          getLocationsUseCase: sl<GetLocationsUseCase>(),
        )..add(
            LocationsLoadEvent(),
          ),
        child: BlocBuilder<LocationsBloc, LocationsState>(
          builder: (BuildContext context, LocationsState state) {
            if (state is Loading) {
              return const LoadingWidget();
            } else if (state is Error) {
              return CustomErrorWidget(
                onTap: () => loadData(context),
              );
            } else if (state is Success) {
              return LocationsContent(
                reachedMax: state.reachedMax,
                locations: state.locations,
                loadMoreData: () => loadData(context),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  void loadData(BuildContext context) async {
    context.read<LocationsBloc>().add(
          LocationsLoadEvent(),
        );
  }
}

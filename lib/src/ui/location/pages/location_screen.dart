import 'package:rick_and_morty/src/domain/location/location.dart';
import 'package:rick_and_morty/src/core/core.dart';
import 'package:rick_and_morty/src/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/location_bloc.dart';
import '../widgets/location_content.dart';

class LocationScreen extends StatelessWidget {
  final String id;

  const LocationScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Location'),
      ),
      body: BlocProvider<LocationBloc>(
        create: (_) => LocationBloc(
          getLocationUseCase: sl<GetLocationUseCase>(),
        )..add(
            LocationLoadEvent(id),
          ),
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (BuildContext context, LocationState state) {
            if (state is Loading) {
              return const LoadingWidget();
            } else if (state is Error) {
              return CustomErrorWidget(onTap: () => refresh(context));
            } else if (state is Success) {
              return LocationContent(
                location: state.location,
              );
            } else {
              return CustomErrorWidget(onTap: () => refresh(context));
            }
          },
        ),
      ),
    );
  }

  void refresh(BuildContext context) async {
    context.read<LocationBloc>().add(
          LocationLoadEvent(id),
        );
  }
}

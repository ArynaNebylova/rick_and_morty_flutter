import 'package:rick_and_morty/features/location/domain/domain.dart';
import 'package:flutter/material.dart';

class LocationContent extends StatelessWidget {
  final LocationEntity location;

  const LocationContent({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('name: ${location.name}'),
              Text('type: ${location.type}'),
              Text('dimension: ${location.dimension}'),
              Text('created: ${DateTime.parse(location.created)}'),
            ],
          ),
        ],
      ),
    );
  }
}

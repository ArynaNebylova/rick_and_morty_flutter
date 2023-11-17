import 'package:rick_and_morty/src/domain/location/location.dart';
import 'package:flutter/material.dart';

class LocationContent extends StatelessWidget {
  final LocationEntity location;

  const LocationContent({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(location.name),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('name: ${location.name}'),
                Text('type: ${location.type}'),
                Text('dimension: ${location.dimension}'),
                Text('created: ${DateTime.parse(location.created).toLocal()}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

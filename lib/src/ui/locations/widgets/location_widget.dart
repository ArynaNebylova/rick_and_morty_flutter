import 'package:rick_and_morty/src/domain/locations/locations.dart';
import 'package:flutter/material.dart';

import '../../location/pages/location_screen.dart';

class LocationWidget extends StatelessWidget {
  final SingleLocationEntity location;
  const LocationWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return LocationScreen(id: location.id);
          }),
        );
      },
      child: ListTile(
        title: Text(location.name),
      ),
    );
  }
}

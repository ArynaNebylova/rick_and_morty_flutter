import 'package:rick_and_morty/src/core_ui/core_ui.dart';
import 'package:rick_and_morty/src/domain/locations/locations.dart';
import 'package:flutter/material.dart';

import 'location_widget.dart';

class LocationsContent extends StatelessWidget {
  final List<SingleLocationEntity> locations;
  final VoidCallback loadMoreData;
  final bool reachedMax;
  const LocationsContent(
      {super.key,
      required this.locations,
      required this.loadMoreData,
      required this.reachedMax});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            if (!reachedMax) {
              loadMoreData();
            }
          }
          return false;
        },
        child: ListView.builder(
          itemCount: reachedMax ? locations.length : locations.length + 1,
          itemBuilder: (context, index) {
            if (index < locations.length) {
              return LocationWidget(
                location: locations[index],
              );
            } else {
              return const Center(
                child: LoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}

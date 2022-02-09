import 'package:dyma_flutter/models/activity.dart';
import 'package:flutter/material.dart';

import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({Key? key, required this.activities}) : super(key: key);

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      crossAxisCount: 2,
      children: activities
          .map((activity) => ActivityCard(activity: activity))
          .toList(),
    );
  }
}

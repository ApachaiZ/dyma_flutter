import 'package:dyma_flutter/models/activity.dart';
import 'package:flutter/material.dart';

import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  const ActivityList(
      {Key? key,
      required this.activities,
      required this.selectedActivities,
      required this.toggleActivity})
      : super(key: key);

  final List<Activity> activities;
  final List<String> selectedActivities;
  final void Function(String) toggleActivity;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      crossAxisCount: 2,
      children: activities
          .map(
            (activity) => ActivityCard(
              activity: activity,
              isSelected: selectedActivities.contains(activity.id),
              toggleActivity: () => toggleActivity(activity.id),
            ),
          )
          .toList(),
    );
  }
}

import 'package:dyma_flutter/models/activity.dart';
import 'package:dyma_flutter/views/city/widgets/trip_activity_card.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  const TripActivityList({
    Key? key,
    required this.activities,
    required this.deleteTripActivity,
  }) : super(key: key);

  final List<Activity> activities;
  final void Function(String) deleteTripActivity;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var activity = activities[index];
          return TripActivityCard(
            activity: activity,
            deleteTripActivity: deleteTripActivity,
          );
        },
        itemCount: activities.length,
      ),
    );
  }
}

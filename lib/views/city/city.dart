import 'package:dyma_flutter/datas/data.dart' as data;
import 'package:dyma_flutter/models/activity.dart';
import 'package:dyma_flutter/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class City extends StatefulWidget {
  City({Key? key}) : super(key: key);
  final List<Activity> activities = data.activities;

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text("Coruscant"),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: GridView.count(
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            crossAxisCount: 2,
            children: widget.activities
                .map((activity) => ActivityCard(
                      activity: activity,
                    ))
                .toList()),
      ),
    );
  }
}

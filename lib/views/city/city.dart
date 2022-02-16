import 'package:dyma_flutter/datas/data.dart' as data;
import 'package:dyma_flutter/models/activity.dart';
import 'package:dyma_flutter/models/trip.dart';
import 'package:dyma_flutter/views/city/widgets/activity_list.dart';
import 'package:dyma_flutter/views/city/widgets/trip_activity_list.dart';
import 'package:dyma_flutter/views/home/widgets/trip_overview.dart';
import 'package:flutter/material.dart';

class City extends StatefulWidget {
  City({Key? key}) : super(key: key);
  final List<Activity> activities = data.activities;

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip myTrip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    myTrip = Trip(
      activities: [],
      date: null,
      city: "Coruscant",
    );
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

  //method pour affichage du datePicker
  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then(
      (newDate) {
        if (newDate != null) {
          setState(
            () {
              myTrip.date = newDate;
            },
          );
        }
      },
    );
  }

  //Index selection de la navbar
  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      myTrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text("Organisation voyage"),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          TripOverview(
            trip: myTrip,
            setDate: setDate,
          ),
          Expanded(
            child: index == 0
                ? ActivityList(
                    activities: widget.activities,
                    selectedActivities: myTrip.activities,
                    toggleActivity: toggleActivity,
                  )
                : TripActivityList(
                    activities: tripActivities,
                    deleteTripActivity: deleteTripActivity,
                  ),
          ),
        ],
      ),

      //navbar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Découverte",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: "Mes activités",
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}

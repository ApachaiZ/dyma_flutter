import 'dart:math';

import 'package:dyma_flutter/models/activity.dart';
import 'package:flutter/material.dart';

class TripActivityCard extends StatefulWidget {
  const TripActivityCard({
    Key? key,
    required this.activity,
    required this.deleteTripActivity,
  }) : super(key: key);

  final Activity activity;
  final void Function(String) deleteTripActivity;

  Color getColor() {
    const colors = [Colors.blue, Colors.red];
    return colors[Random().nextInt(2)];
  }

  @override
  _TripActivityCardState createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  late Color color;

  @override
  void initState() {
    color = widget.getColor();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(
          widget.activity.name,
          style: TextStyle(
            color: color,
          ),
        ),
        subtitle: Text(widget.activity.city),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            widget.deleteTripActivity(widget.activity.id);
          },
        ),
      ),
    );
  }
}

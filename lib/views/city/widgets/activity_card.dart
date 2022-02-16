import 'package:dyma_flutter/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    required this.activity,
    required this.isSelected,
    required this.toggleActivity,
  }) : super(key: key);

  final Activity activity;
  final bool isSelected;
  final VoidCallback toggleActivity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Ink.image(
            image: AssetImage(activity.image),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: toggleActivity,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isSelected)
                        const Icon(
                          Icons.check,
                          size: 40,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    children: [
                      Text(
                        activity.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.5, 1.5),
                              blurRadius: 1.5,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

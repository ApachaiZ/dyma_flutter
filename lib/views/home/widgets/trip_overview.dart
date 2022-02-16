import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip trip;

  double get myPrice {
    return 0;
  }

  const TripOverview({
    Key? key,
    required this.trip,
    required this.setDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 150,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Coruscant",
            style: TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  trip.date != null
                      ? DateFormat("dd/MM/yyyy").format(trip.date!)
                      : "Choisissez une date",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () => setDate(),
                child: const Text('Sélectionner une date'),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Montant par personne :",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  "$myPrice €",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dyma_flutter/views/city/city.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home(),
      home: City(),
    );
  }
}

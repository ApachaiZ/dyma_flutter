import 'package:dyma_flutter/views/home/widgets/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {
      'name': 'Coruscant',
      'image': 'assets/images/coruscant/coruscant.jpg',
      'checked': false,
    },
    {
      'name': 'Endor',
      'image': 'assets/images/endor/endor.jpg',
      'checked': false,
    },
    {
      'name': 'Tatooine',
      'image': 'assets/images/tatooine/tatooine.jpg',
      'checked': false,
    },
  ];

  void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(
      () {
        cities[index]['checked'] = !cities[index]['checked'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('BobbaTrip'),
        actions: const [Icon(Icons.more)],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map(
              (city) {
                return CityCard(
                  name: city['name'],
                  image: city['image'],
                  checked: city['checked'],
                  updateChecked: () {
                    switchChecked(city);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

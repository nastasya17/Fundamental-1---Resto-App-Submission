import 'dart:convert';
import 'text_theme.dart';
import 'package:flutter/material.dart';
import 'restaurant.dart';
import 'detail_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find My Resto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: myTextTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        RestoListPage.routeName: (context) => RestoListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}

class RestoListPage extends StatelessWidget {

  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'Find My Resto',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 115, 0),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 115, 1),
                    Color.fromARGB(255, 184, 99, 2),
                  ],
                ),
              ),
            ),
          ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/restaurants.json'),
        builder: (context, snapshot) {
          var jsonMap = jsonDecode(snapshot.data!);
          var restaurant = Welcome.fromJson(jsonMap);

          return ListView.builder(
            itemCount: restaurant.restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(
                  context, restaurant.restaurants[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      leading: Image.network(
        restaurant.pictureId,
        width: 120,
      ),
      title: Text(restaurant.name),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.place,
                size: 12,
              ),
              Text(restaurant.city),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 12,
              ),
              Text('${restaurant.rating}'),
            ],
          ),
        ],
      ),
      // subtitle: Text(restaurant.city),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
    );
  
  }
}


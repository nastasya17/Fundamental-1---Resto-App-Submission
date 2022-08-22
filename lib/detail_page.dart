import 'package:flutter/material.dart';
import 'restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Container(
                margin: const EdgeInsets.all(8),
                color: const Color.fromARGB(255, 251, 126, 1),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Center(
                  child: Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 251, 126, 1),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                restaurant.pictureId,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Column(
                children: [
                  Text(restaurant.id, style: Theme.of(context).textTheme.subtitle1,),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        size: 15,
                        color: Color.fromARGB(255, 251, 126, 1),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 251, 126, 1),
                        size: 15,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${restaurant.rating}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.justify,
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Foods',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: restaurant.menus.foods
                                    .map((food) => Text(
                                          food.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ))
                                    .toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Drinks',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: restaurant.menus.drinks
                                    .map((drink) => Text(
                                          drink.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

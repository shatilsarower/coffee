import 'package:coffee/pages/coffee_tile.dart';
import 'package:coffee/pages/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeTypes = [
    //[coffee type, isSelected]
    [
      'Cappuccino',
      true,
    ],
    [
      'Black',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Tea',
      false,
    ],

    // {
    //   "type": 'Black',
    //   "isSelect": true,
    // },
    // {
    //   "type": 'Latte',
    //   "isSelect": true,
    // },
    // {
    //   "type": 'Tea',
    //   "isSelect": true,
    // },
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      //this is for loop makes every selection false

      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Notifications',
          ),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Text(
              "Find the best Coffee for you",
              style: GoogleFonts.almarai(
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),

            // Implementing of Searchbar

            child: TextField(
              decoration: InputDecoration(
                alignLabelWithHint: true,
                prefixIcon: const Icon(
                  Icons.search,
                ),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // Search bar
          // Horizontal listview of Coffee types
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeetype: coffeeTypes[index][0],
                  isSelected: coffeeTypes[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          // Horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  coffeeImagePath: 'asstes/image/latte.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.30',
                ),
                CoffeeTile(
                  coffeeImagePath: 'asstes/image/capuchino.jpg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '5.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'asstes/image/extressio.jpg',
                  coffeeName: 'Espresso',
                  coffeePrice: '2.0',
                ),
                CoffeeTile(
                  coffeeImagePath: 'asstes/image/ice-tea.jpg',
                  coffeeName: 'Ice Tea',
                  coffeePrice: '3.56',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

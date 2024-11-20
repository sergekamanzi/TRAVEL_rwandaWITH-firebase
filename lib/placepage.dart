import 'package:flutter/material.dart';
import 'homepage.dart'; // Import HomePage for navigation
import 'contactpage.dart'; // Import ContactPage for navigation

class PlacesPage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  PlacesPage({required this.onThemeChanged});

  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  int _currentIndex = 1; // Set default to the places page
  bool isDarkTheme = false; // Default to light theme
  List<bool> likedPlaces = []; // List to track liked places

  @override
  void initState() {
    super.initState();
    // Initialize the likedPlaces list with false for each place
    likedPlaces = List<bool>.filled(25, false); // Adjust 25 based on total number of places
  }

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 95, 75),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo3.png', 
          width: 100,
          height: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Explore Categories',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF007BFF),
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Places to Visit by Category',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF04B177),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Moles Category
                  buildCategory('Conventions', [
                    buildPlace(0, 'assets/images/house1.jpg', 'Conversion center', textColor, 'Kigali Convention Centre, officially launched in \nJuly 2016, is earmarked to become the leading conference venue in the region.\n \n\n location: KG2 Roundabout, Kimihurura Kigali- Rwanda'),
                    buildPlace(1, 'assets/images/house2.jpg', 'Intare Conference', textColor, 'Intare Conference Arena sits in Kigali the\n center of international conference networks of Rwanda, with a world-class airline and air links to about 30 cities\n \n \n  location: Rusororo, Rwanda'),
                    buildPlace(2, 'assets/images/house3.jpg', 'BkArena House', textColor,     'BK Arena is a state of the art world class \nhub for entertainment, sports and events and is fast becoming East Africas most sought after venue.\n \n\n location:KG 17 Ave, Kigali-Rwanda'),
                  ], textColor),

                  // Hotels Category
                  buildCategory('Hotels', [
                    buildPlace(3, 'assets/images/hotel1.jpg', 'Raddison Hotel', textColor, 'Our Kigali hotels 291 rooms and suites offer private balconies and free high-speed Wi-Fi. 2 on-site restaurants.\n\n 5 star hotel\n\n location: Kigali, Convention Ctr Roundabout, Kigali'),
                    buildPlace(4, 'assets/images/hotel2.jpg', 'Mariott Hotel', textColor, 'Marriott Bonvoy® Offers You Endless Experiences and World-Class Rewards. Start Exploring. \n\n4.6 star hotel\n \nlocation:Kigali Marriott Hotel, KN 3 Ave, Kigali'),
                    buildPlace(5, 'assets/images/hotel3.jpg', 'Ubumwe Resort', textColor, 'Ubumwe Grande Hotel has easy access from different parts of the city. Spacious Suites. Great Location. Mountain Views. City Views.\n \n4.4 star hotel \n\nlocation:Ubumwe Grande Hotel, KN 67 St, Kigali'),
                    buildPlace(6, 'assets/images/hotel4.jpg', 'Serena Hotel', textColor, 'Kigali Serena Hotel. Book a 5-star hotel in the heart of Kigali, Rwanda. Elegant accommodation, fine dining and a state of the art Conference Centre.\n\n 5 star hotel \n\n location:Kigali Serena Hotel, KN 3 Ave, Kigali'),
                    buildPlace(7, 'assets/images/hotel5.jpg', 'Mantis Kivu Bay', textColor, 'A unique voyage with Mantis Kivu Queen uBuranga, a distinctive all-inclusive luxury expedition vessel.\n\n 4.5 star hotel \n\n location:kivu-western province'),
                  ], textColor),

                  // Mountains Category
                  buildCategory('Mountains', [
                    buildPlace(8, 'assets/images/mount1.jpg', 'Mt. Kalisimbi', textColor, 'Karisimbi Volcano is the highest of the Virunga. The highest peak of Karisimbi Volcano is at 4507-m and hiking takes 2 days to the summit.\n\n\n location:border between Rwanda and the Democratic Republic of Congo'),
                    buildPlace(9, 'assets/images/mount2.jpg', 'Sabyinyo Mountains', textColor, 'Mount Sabyinyo is the oldest of all the Virunga massif volcanoes, dating from the early part of the Pleistocene Epoch, which began about 2,600,000 million years ago and lasted until 11,700 years ago.\n\n\n location:border btn Rwanda, DRC and Uganda'),
                    buildPlace(10, 'assets/images/mount3.jpg', 'Bisoke Peak', textColor, 'Mt. Bisoke is one of the eight volcanoes in the Virunga mountains range of the Albertine Rift, the western part of the east African rift.'),
                    buildPlace(11, 'assets/images/mount4.jpg', 'Huye Peak', textColor, 'Detailed information about Huye Peak'),
                    buildPlace(12, 'assets/images/mount5.jpg', 'Nyiragongo Peak', textColor, 'Mount Nyiragongo is an active stratovolcano with an elevation of 3,470 m in the Virunga Mountains associated with the Albertine Rift.\n\n\n location: Virunga Mountains of east-central Africa.'),
                  ], textColor),

                  // Memorial Sites Category
                  buildCategory('Memorial Sites', [
                    buildPlace(13, 'assets/images/site1.jpg', 'Nyamata Genocide Memorial', textColor, 'The Nyamata Genocide Memorial was desacralized by the Roman Catholic Church on 11th April 1997 and transformed into a memorial to the victims of the genocide.'),
                    buildPlace(14, 'assets/images/site2.jpeg', 'Murambi Genocide Memorial', textColor, 'The Murambi Genocide Memorial was created on 21st April 1995. During the genocide, the Tutsis of this region sought sanctuary at Murambi, where a technical school was being constructed.\n\n\n location:  Gikongoro, Karaba'),
                    buildPlace(15, 'assets/images/site3.jpeg', 'Gisozi Genocide Memorial', textColor, 'Some 250,000 Tutsis were killed in Kigali during the genocide. In its wake the authorities organised mass burial here.\n\n\n location:  Gisozi, Rwanda'),
                    buildPlace(16, 'assets/images/site4.jpg', 'Bisesero Genocide Memorial', textColor, 'The Bisesero Genocide Memorial is about 25 km from Kibuye (now Karongi) in the mountainous Lake Kivu district to the West.'),
                  ], textColor),

                  // National parks Category
                  buildCategory('National Parks', [
                    buildPlace(17, 'assets/images/park1.jpg', 'Akagera National Park', textColor, 'Akagera has an inspiring conservation story as it is now home to lions and rhinos, and is the only Big Five park in the country. \n\n\n location: Akagera Road, Akagera'),
                    buildPlace(18, 'assets/images/park2.jpg', 'Nyungwe National Park', textColor, 'One of the oldest rainforests in Africa, Nyungwe is rich in biodiversity and spectacularly beautiful. \n\n\n location: Rusizi district'),
                    buildPlace(19, 'assets/images/park3.jpg', 'Gishwati National Park', textColor, 'Spectacular trees, rushing waterfalls, and lush forest form a beautiful and unique environment. \n\n\n location: Rubavu District'),
                  ], textColor),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 18, 103, 70),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(onThemeChanged: widget.onThemeChanged)),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactPage(onThemeChanged: widget.onThemeChanged)),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/discover.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/more.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget buildCategory(String categoryName, List<Widget> places, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF006E52),
          ),
        ),
        SizedBox(height: 10),
        Column(children: places),
        SizedBox(height: 30),
      ],
    );
  }

  Widget buildPlace(int index, String imagePath, String title, Color textColor, String description) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imagePath),
                  SizedBox(height: 10),
                  Text(description),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: textColor),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  likedPlaces[index] = !likedPlaces[index]; // Toggle liked state
                });
              },
              child: Image.asset(
                likedPlaces[index] 
                    ? 'assets/images/red.png' // Path to filled heart image
                    : 'assets/images/heart.png', // Path to empty heart image
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

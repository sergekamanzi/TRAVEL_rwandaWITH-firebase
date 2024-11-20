import 'package:flutter/material.dart';
import 'pages/moles.dart';
import 'placepage.dart'; // Import PlacesPage
import 'contactpage.dart'; // Import ContactPage


class HomePage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  HomePage({required this.onThemeChanged});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Tracks the selected index of BottomNavigationBar

  // ignore: unused_field
  final List<Widget> _pages = [
    HomePage(onThemeChanged: (bool) {}), // Home Page
    PlacesPage(onThemeChanged: (bool) {}), // Places Page
    ContactPage(onThemeChanged: (bool) {}), // Contact Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo3.png',
          width: 100,
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 95, 75),
      ),

      // Sub-navbar with subtitle
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
                  Text(
                    'Discover Places',
                    style: TextStyle(fontSize: 18, color: Color(0xFF007BFF)),
                  ),
                ],
              ),
            ),

            // Places to Visit Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Top Places to Visit',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF04B177),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Column of clickable place cards
                  Column(
                    children: [
                      placeCard(
                        context,
                        'assets/images/1.jpg',
                        'Beautiful Convension',
                        'A pristine house with crystal clear view.',
                        'Beautiful Conversion Details',
                        '2-3 hours'
                      ),
                      SizedBox(height: 15),
                      placeCard(
                        context,
                        'assets/images/2.jpg',
                        'Mountain Peak',
                        'Stunning mountain views and hiking trails.',
                        'Mountain Peak Details',
                        '3-5 hours' // Average time spent
                      ),
                      SizedBox(height: 15),
                      placeCard(
                        context,
                        'assets/images/3.jpg',
                        'Agri-culture move',
                        'Harvesting in Rwanda in ancient modern.',
                        'Agri-culture move Details',
                        '1-2 hours' // Average time spent
                      ),
                      SizedBox(height: 15),
                      placeCard(
                        context,
                        'assets/images/4.jpg',
                        'Historical Monument',
                        'Past history and breathtaking architecture.',
                        'Historical Monument Details',
                        '1 hour' // Average time spent
                      ),
                      SizedBox(height: 15),
                      placeCard(
                        context,
                        'assets/images/park5.jpg',
                        'Nyandungu park',
                        'Nyandungu Wetland complex in the outskirts of Kigali.',
                        'Nyandungu Park Details',
                        '2-4 hours' // Average time spent
                      ),
                      SizedBox(height: 15),
                      placeCard(
                        context,
                        'assets/images/gisenyi.jpg',
                        'Gisenyi & Lake Kivu',
                        'Gisenyi & Lake Kivu is one of the most visited places for great holidays.',
                        'Gisenyi & Lake Kivu Details',
                        '3-6 hours' // Average time spent
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navbar with images for Home, Places, and Contact (without labels)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 18, 103, 70),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(onThemeChanged: widget.onThemeChanged),
              ),
            ); // Navigate to HomePage
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PlacesPage(onThemeChanged: widget.onThemeChanged),
              ),
            ); // Navigate to PlacesPage
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ContactPage(onThemeChanged: widget.onThemeChanged),
              ),
            ); // Navigate to ContactPage
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/discover.png', width: 24, height: 24),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/more.png', width: 24, height: 24),
            label: "",
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
      ),
    );
  }

  // Widget for clickable place card, navigates to details page
  Widget placeCard(BuildContext context, String image, String title, String description, String detailsPageTitle, String averageTime) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailsPage(
              imagePath: image,
              title: title,
              description: description,
              detailsPageTitle: detailsPageTitle,
              averageTime: averageTime, elevationGain: '500 meters', distance: '3 kilometers', about: 'this was inverted on more than just structures; they represent our history, culture, and evolving needs as a society. From the ancient dwellings of our ancestors to modern architectural marvels, houses have undergone significant transformations. This article explores the evolution of houses, highlighting key architectural styles, materials, and the impact of cultural shifts.', additionalDescription: '', // Pass the average time
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12, spreadRadius: 1)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 160,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

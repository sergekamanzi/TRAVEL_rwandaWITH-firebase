import 'package:flutter/material.dart';
// Assuming you need this
// Assuming you need this
import 'settings.dart'; // Import the settings page

class ContactPage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  ContactPage({required this.onThemeChanged});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int _currentIndex = 2; // Set default to the contact page
  bool isDarkTheme = false; // Default to light theme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 95, 75),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo3.png', // Path to your logo image
          width: 100,
          height: 50, // Adjust the height as needed
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            // User profile section
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/ellipse.png'), // Placeholder for profile image
            ),
            const SizedBox(height: 10),
            Text(
              'willy kalisa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'since 2024',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),

            // Options with images
            ListTile(
              leading: Image.asset('assets/images/love.png', width: 24, height: 24), // Replace with your image
              title: Text('Your favorites', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Add your logic here
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/plane.png', width: 24, height: 24), // Replace with your image
              title: Text('Tell your friends', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Add your logic here
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/promo.png', width: 24, height: 24), // Replace with your image
              title: Text('Promotions', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Add your logic here
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/sett.png', width: 24, height: 24), // Replace with your image
              title: Text('Settings', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Navigate to the SettingsPage when clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()), // Navigate to SettingsPage
                );
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/logout.png', width: 24, height: 24), // Replace with your image
              title: Text('Logout', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Navigate to the LoginPage when clicked
                   Navigator.pushReplacementNamed(context, '/login'); // Assuming '/login' is the route for login.dart// Add your logic here
              },
            ),
          ],
        ),
      ),
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
            Navigator.pushReplacementNamed(context, '/homepage');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/places');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/contact');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24), // Update with your image
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/discover.png', width: 24, height: 24), // Update with your image
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/more.png', width: 24, height: 24), // Update with your image
            label: "",
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
      ),
    );
  }
}

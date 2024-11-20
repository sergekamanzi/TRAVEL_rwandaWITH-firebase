import 'package:flutter/material.dart';

class MolesPage extends StatelessWidget {
  const MolesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moles'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Navigates back to homepage
          },
          child: Image.asset(
            'assets/images/arrow.png', // Replace with your image path
            width: 24,
            height: 24,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 203, 199, 201), // Set your desired background color here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded border radius
          ),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              placeCard(
                context,
                imagePath: 'assets/images/1.jpg',
                title: 'Beautiful Convension',
                subtitle: 'A pristine house with crystal clear view.',
                detailsPageTitle: 'Beautiful Convension Details',
                averageTime: '4 hours',
                elevationGain: '452 ft',
                distance: '1.3 miles',
                about: 'Enjoy the tranquility and beauty of the surrounding nature in Moles.',
              ),
              const SizedBox(height: 15),
              placeCard(
                context,
                imagePath: 'assets/images/2.jpg',
                title: 'Mountain Peak',
                subtitle: 'Stunning mountain views and hiking trails.',
                detailsPageTitle: 'Mountain Peak Details',
                averageTime: '5 hours',
                elevationGain: '1000 ft',
                distance: '3 miles',
                about: 'A challenging hike that rewards you with breathtaking views at the summit.',
              ),
              const SizedBox(height: 15),
              placeCard(
                context,
                imagePath: 'assets/images/3.jpg',
                title: 'Agri-culture move',
                subtitle: 'Harvesting in Rwanda in ancient modern.',
                detailsPageTitle: 'Agri-culture move Details',
                averageTime: '3 hours',
                elevationGain: '300 ft',
                distance: '2 miles',
                about: 'Experience the rich agricultural heritage of Rwanda with hands-on activities.',
              ),
              const SizedBox(height: 15),
              placeCard(
                context,
                imagePath: 'assets/images/4.jpg',
                title: 'Historical Monument',
                subtitle: 'Past history and breathtaking architecture.',
                detailsPageTitle: 'Historical Monument Details',
                averageTime: '2 hours',
                elevationGain: '150 ft',
                distance: '0.5 miles',
                about: 'Explore the historical significance and architectural beauty of this monument.',
              ),
              const SizedBox(height: 15),
              placeCard(
                context,
                imagePath: 'assets/images/park5.jpg',
                title: 'Nyandungu Park',
                subtitle: 'Nyandungu Wetland complex in the outskirts of Kigali.',
                detailsPageTitle: 'Nyandungu Park Details',
                averageTime: '6 hours',
                elevationGain: '600 ft',
                distance: '4 miles',
                about: 'A serene park offering walking trails and a chance to connect with nature.',
              ),
              const SizedBox(height: 15),
              placeCard(
                context,
                imagePath: 'assets/images/gisenyi.jpg',
                title: 'Gisenyi & Lake Kivu',
                subtitle: 'Gisenyi & Lake Kivu is one of the most visited places for great holidays.',
                detailsPageTitle: 'Gisenyi & Lake Kivu Details',
                averageTime: '7 hours',
                elevationGain: '750 ft',
                distance: '5 miles',
                about: 'Relax by the shores of Lake Kivu and enjoy various water activities.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create a place card with full-width image and details below the image
  Widget placeCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required String detailsPageTitle,
    required String averageTime,
    required String elevationGain,
    required String distance,
    required String about, // New parameter for about section
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailsPage(
              imagePath: imagePath,
              title: title,
              description: subtitle,
              detailsPageTitle: detailsPageTitle,
              averageTime: averageTime,
              elevationGain: elevationGain,
              distance: distance,
              about: '', additionalDescription: '', // Pass the about information to the details page
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full-width image with increased height
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300, // Adjust the height to make the image bigger
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // About section
                  Text(
                    about,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Display place info below the text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCard(label: 'Avg Time', value: averageTime),
                      InfoCard(label: 'Elevation', value: elevationGain),
                      InfoCard(label: 'Distance', value: distance),
                    ],
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

class PlaceDetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String detailsPageTitle;
  final String averageTime;
  final String elevationGain;
  final String distance;
  final String about; // Added about parameter

  const PlaceDetailsPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.detailsPageTitle,
    required this.averageTime,
    required this.elevationGain,
    required this.distance,
    required this.about, required String additionalDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detailsPageTitle),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/images/back.png', // Replace with your image path
            width: 10,
            height: 10,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[50], // Set background color for details page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            const SizedBox(height: 15),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(
              about, // Display the about information
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(label: 'Average Time', value: averageTime),
                InfoCard(label: 'Elevation Gain', value: elevationGain),
                InfoCard(label: 'Distance', value: distance),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

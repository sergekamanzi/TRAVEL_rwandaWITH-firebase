import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: screenHeight * 0.6, 
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome1.jpg'), 
                  fit: BoxFit.cover,
                ),
              
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90), 
                ),
              ),
            ),
          ),
         
          Positioned(
            top: 180, 
            left: 20, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Need",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "VACATION?",
                  style: TextStyle(
                    fontSize: 36,
                    color: const Color.fromARGB(255, 18, 51, 107),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's take a trip with us.",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 35, 34, 34),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.66, 
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
                Text(
                  "TRAVEL RW.",
                  style: TextStyle(
                    fontSize: 34,
                    color: const Color.fromARGB(255, 30, 163, 37),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "explore more now.",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 39, 38, 38),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                onPressed: () {
          
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 19, 87, 74),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, 
                  ),
                ),
                child: Text(
                  "Get Started now",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

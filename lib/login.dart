import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart'; // Import HomePage
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_service.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  // Sign in function
  void _signIn() async {
    User? user = await _authService.signIn(
      _emailController.text,
      _passwordController.text,
    );
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(onThemeChanged: (bool) {})),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid credentials, please try again.'),
      ));
    }
  }

  // Google Sign-In function
  void _signInWithGoogle() async {
    User? user = await _authService.signInWithGoogle();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(onThemeChanged: (bool) {})),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Google Sign-In failed, please try again.'),
      ));
    }
  }

  // Build TextField widget to avoid code repetition
  Widget _buildTextField(String labelText,
      {required TextEditingController controller, bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  // Build Social Media Icon button with onTap function
  Widget _buildSocialIcon(IconData icon, Color color, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Icon(icon, color: color, size: 32),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              color: Color(0xFF004D40),
              width: double.infinity,
              child: Center(
                child: Image.asset('assets/images/logo3.png', height: 80),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Log in with your account',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField('Email', controller: _emailController),
                  SizedBox(height: 16),
                  _buildTextField('Password',
                      controller: _passwordController, obscureText: true),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004D40),
                      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('or sign in with'),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google sign-in icon
                      _buildSocialIcon(FontAwesomeIcons.google, Colors.red, _signInWithGoogle),
                      SizedBox(width: 16),
                      _buildSocialIcon(
                          FontAwesomeIcons.instagram, Colors.purpleAccent, () {}),
                      SizedBox(width: 16),
                      _buildSocialIcon(FontAwesomeIcons.facebookF, Colors.blue, () {}),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text('SIGN UP'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

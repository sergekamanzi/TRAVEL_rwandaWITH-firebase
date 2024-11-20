import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login.dart'; // Import the LoginPage
import 'auth_service.dart'; // Import AuthService

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController(); // Added for name input
  final TextEditingController _confirmPasswordController = TextEditingController();
  final AuthService _authService = AuthService();

  // Sign up function
  void _signUp() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      User? user = await _authService.signUp(
        _emailController.text,
        _passwordController.text,
        _nameController.text, // Pass the name to AuthService
      );
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error signing up. Please try again.'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Passwords do not match!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                color: Color(0xFF004D40),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo3.png',
                      height: 80,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    _buildTextField('Name', controller: _nameController), // Added name field
                    SizedBox(height: 16),
                    _buildTextField('Email', controller: _emailController),
                    SizedBox(height: 16),
                    _buildTextField('Password', controller: _passwordController, obscureText: true),
                    SizedBox(height: 16),
                    _buildTextField('Confirm password', controller: _confirmPasswordController, obscureText: true),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF004D40),
                        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 26),
                    Text('or sign up with'),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(FontAwesomeIcons.google, Colors.red),
                        SizedBox(width: 16),
                        _buildSocialIcon(FontAwesomeIcons.instagram, Colors.purpleAccent),
                        SizedBox(width: 16),
                        _buildSocialIcon(FontAwesomeIcons.facebookF, Colors.blue),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Text('SIGN IN', style: TextStyle(color: Color(0xFF004D40))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color),
    );
  }
}

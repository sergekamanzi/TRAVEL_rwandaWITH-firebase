import 'package:cloud_firestore/cloud_firestore.dart'; // Added for Firestore
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firestore instance

  // Initialize Firebase
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  // Sign up a user and save user details in Firestore
  Future<User?> signUp(String email, String password, String name) async { // Updated method signature
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user data to Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'Name': name,
        'Email': email,
      });

      return userCredential.user;
    } catch (e) {
      print("Error signing up: $e");
      return null;
    }
  }

  // Sign in a user
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // Sign out a user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Google sign-in
  Future<User?> signInWithGoogle() async {
    try {
      // Initialize GoogleSignIn and pass the Client ID
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: '263446716531-ju72jagb8j2utcclk0577j4nlq01kkng.apps.googleusercontent.com',
      );

      // Start the sign-in process
      final GoogleSignInAccount? gUser = await googleSignIn.signIn();
      if (gUser == null) {
        return null; // User canceled sign-in
      }

      // Get authentication details
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create credential using accessToken and idToken
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in with Firebase
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  // Check if the user is signed in
  Stream<User?> get user {
    return _auth.authStateChanges();
  }
}

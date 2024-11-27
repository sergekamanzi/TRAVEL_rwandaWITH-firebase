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

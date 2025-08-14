
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: user == null
          ? const Center(child: Text('User not logged in'))
          : FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(
                    child: Text(
                      'No user data found for ${user.email}',
                      style: GoogleFonts.montserrat(),
                    ),
                  );
                }

                final userData = snapshot.data!.data() as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email: ${user.email}',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Name: ${userData['name'] ?? 'N/A'}',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Role: ${userData['role'] ?? 'N/A'}',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                      // Add more profile fields as needed
                    ],
                  ),
                );
              },
            ),
    );
  }
}

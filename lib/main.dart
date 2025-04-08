import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _image;

  // Function to simulate picking an image
  Future<void> _pickImage() async {
    setState(() {
      // Simulate selecting an image
      _image = "https://i.postimg.cc/025rcRrb/photo-2025-03-01-01-03-17.jpg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    // Check if the user has selected an image
                    backgroundImage: _image != null
                        ? NetworkImage(_image!)
                        : const NetworkImage(
                            'https://i.postimg.cc/025rcRrb/photo-2025-03-01-01-03-17.jpg'),
                  ),
                  // Show icon only if image is not selected
                  if (_image == null)
                    const Icon(Icons.add_a_photo, size: 30, color: Colors.white70),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: const Text('Choose Image'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 32, 224, 205)),
            ),
          ],
        ),
      ),
    );
  }
}

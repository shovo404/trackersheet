import 'package:flutter/material.dart';

void main() {
  runApp(const ImageGridApp());
}

class ImageGridApp extends StatelessWidget {
  const ImageGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Grid App',
      debugShowCheckedModeBanner: false,
      home: const ImageGridScreen(),
    );
  }
}
class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});
  static const List<String> imageUrls = [
    'https://images.pexels.com/photos/1193743/pexels-photo-1193743.jpeg?auto=compress&cs=tinysrgb&w=600', // Your first image
    'https://images.pexels.com/photos/596710/pexels-photo-596710.jpeg?auto=compress&cs=tinysrgb&w=600', // image 2
    'https://images.pexels.com/photos/45229/drop-of-water-inject-water-drip-45229.jpeg?auto=compress&cs=tinysrgb&w=600', // image 3
    'https://images.pexels.com/photos/2695623/pexels-photo-2695623.jpeg?auto=compress&cs=tinysrgb&w=600', // image 4
    'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600', // image 5
    'https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&w=600', // image 6
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Grid'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 8.0, 
            mainAxisSpacing: 8.0, 
            childAspectRatio: 1, 
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  ImageGridScreen.imageUrls[index],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error));
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
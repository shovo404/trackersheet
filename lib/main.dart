import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Card Example',
      debugShowCheckedModeBanner: false,
      home: const CustomCardListScreen(),
    );
  }
}

class CustomCardListScreen extends StatelessWidget {
  const CustomCardListScreen({super.key});

  // List of items to display in the ListView
  static const List<Map<String, String>> items = [
    {
      'image': 'https://images.pexels.com/photos/1193743/pexels-photo-1193743.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Beautiful Landscape',
      'subtitle': 'Nature',
      'description': 'A beautiful view of mountains and trees during sunset.'
    },
    {
      'image': 'https://images.pexels.com/photos/596710/pexels-photo-596710.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Water Droplet',
      'subtitle': 'Nature',
      'description': 'A close-up shot of a water droplet on a leaf.'
    },
    {
      'image': 'https://images.pexels.com/photos/45229/drop-of-water-inject-water-drip-45229.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Water Injection',
      'subtitle': 'Science',
      'description': 'A close-up shot of a water injection into a surface.'
    },
    {
      'image': 'https://images.pexels.com/photos/2695623/pexels-photo-2695623.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Sunny Beach',
      'subtitle': 'Vacation',
      'description': 'A bright and sunny beach with clear blue waters.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Cards'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomCard(
            imageUrl: items[index]['image']!,
            title: items[index]['title']!,
            subtitle: items[index]['subtitle']!,
            description: items[index]['description']!,
          );
        },
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const CustomCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // You can add action on tap if needed
        print('Tapped on ${widget.title}');
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? Colors.black38 : Colors.black26,
                blurRadius: 8.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  widget.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
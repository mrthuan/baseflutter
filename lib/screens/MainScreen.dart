import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  final List<Map<String, String>> features = [
    {
      'image': 'assets/images/interior_design_preview.png',
      'title': 'Interior Design',
      'desc': 'Upload a pic, choose a style, let AI design the room!'
    },
    {
      'image': 'assets/images/replace_objects_preview.png',
      'title': 'Replace Objects',
      'desc': 'Choose any object you wanna change, see it transform!'
    },
    {
      'image': 'assets/images/garden_design_preview.png',
      'title': 'Garden Design',
      'desc': 'Choose a style you adore and give your garden a whole new vibe with just a simple touch!'
    },
    {
      'image': 'assets/images/exterior_design_preview.png',
      'title': 'Exterior Design',
      'desc': 'Snap your home, pick a vibe, let AI craft the facade!'
    },
    {
      'image': 'assets/images/reference_style_preview.png',
      'title': 'Reference Style',
      'desc': 'Show AI what you like and let it apply it to your room!'
    },
    {
      'image': 'assets/images/paint_preview.png',
      'title': 'Paint',
      'desc': 'Pick any color you love and transform your space with just a touch!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: SizedBox(
          width: 70,
          height: 70,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'PRO',
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'home ai',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: GridView.builder(
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 16,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            final feature = features[index];
            return _buildFeatureCard(
              imagePath: feature['image']!,
              title: feature['title']!,
              description: feature['desc']!,
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
            );
          },

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/create');
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_fix_high),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'My Profile',
          ),
        ],
      ),

    );
  }

  Widget _buildFeatureCard({
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.outfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: GoogleFonts.outfit(
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'Try It!',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

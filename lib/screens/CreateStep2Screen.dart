import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_step3_screen.dart';

class CreateStep2Screen extends StatefulWidget {
  final dynamic selectedImage;
  final bool isAsset;

  const CreateStep2Screen({
    Key? key,
    required this.selectedImage,
    required this.isAsset,
  }) : super(key: key);

  @override
  State<CreateStep2Screen> createState() => _CreateStep2ScreenState();
}

class _CreateStep2ScreenState extends State<CreateStep2Screen> {
  final List<Map<String, dynamic>> roomTypes = [
    {'label': 'Kitchen', 'icon': Icons.kitchen},
    {'label': 'Living Room', 'icon': Icons.weekend},
    {'label': 'Home Office', 'icon': Icons.apartment},
    {'label': 'Bedroom', 'icon': Icons.bed},
    {'label': 'Bathroom', 'icon': Icons.bathtub},
    {'label': 'Dining Room', 'icon': Icons.restaurant},
    {'label': 'Coffee Shop', 'icon': Icons.coffee},
    {'label': 'Study Room', 'icon': Icons.edit},
    {'label': 'Restaurant', 'icon': Icons.emoji_people},
    {'label': 'Gaming Room', 'icon': Icons.sports_esports},
    {'label': 'Office', 'icon': Icons.desktop_windows},
    {'label': 'Attic', 'icon': Icons.holiday_village},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Step 2 / 4',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 2,
            margin: EdgeInsets.only(left: 24, right: 24, bottom: 8),
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.black)),
                Expanded(child: Container(color: Colors.black)),
                Expanded(child: Container(color: Colors.grey[300])),
                Expanded(child: Container(color: Colors.grey[300])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose Room',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select a room to design and see it transformed in your chosen style',
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3.5,
              ),
              itemCount: roomTypes.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey[100],
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          roomTypes[index]['icon'],
                          size: 22,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            roomTypes[index]['label'],
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: selectedIndex != null
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateStep3Screen(
                        selectedImage: widget.selectedImage,
                        isAsset: widget.isAsset,
                        selectedRoom: roomTypes[selectedIndex!]['label'],
                      ),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  selectedIndex != null ? Colors.red : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                    selectedIndex != null ? Colors.white : Colors.black45,
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

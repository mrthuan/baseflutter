import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_step4_screen.dart';

class CreateStep3Screen extends StatefulWidget {
  final dynamic selectedImage;
  final bool isAsset;
  final String selectedRoom;

  const CreateStep3Screen({
    Key? key,
    required this.selectedImage,
    required this.isAsset,
    required this.selectedRoom,
  }) : super(key: key);

  @override
  _CreateStep3ScreenState createState() => _CreateStep3ScreenState();
}

class _CreateStep3ScreenState extends State<CreateStep3Screen> {
  final List<Map<String, String>> styles = [
    {'label': 'Custom', 'image': 'assets/styles/custom_icon.png'},
    {'label': 'Modern', 'image': 'assets/styles/moderm.jpg'},
    {'label': 'Tropical', 'image': 'assets/styles/tropical.webp'},
    {'label': 'Minimalistic', 'image': 'assets/styles/minimal.webp'},
    {'label': 'Bohemian', 'image': 'assets/styles/bohemian.jpg'},
    {'label': 'Rustic', 'image': 'assets/styles/rustic.jpg'},
    {'label': 'Vintage', 'image': 'assets/styles/vintage.jpg'},
    {'label': 'Baroque', 'image': 'assets/styles/baroque.jpg'},
    {'label': 'Mediterranean', 'image': 'assets/styles/mediterranean.png'},
    {'label': 'Gamer', 'image': 'assets/styles/gamer.png'},
    {'label': 'Cozy', 'image': 'assets/styles/cozy.png'},
    {'label': 'Coastal', 'image': 'assets/styles/coastal.jpg'},
    {'label': 'Japandi', 'image': 'assets/styles/japandi.webp'},
    {'label': 'Cottagecore', 'image': 'assets/styles/cottagecore.jpg'},
    {'label': 'Ski Chalet', 'image': 'assets/styles/ski_chalet.jpg'},
    {'label': 'Gothic', 'image': 'assets/styles/gothic.jpg'},
    {'label': 'Creepy', 'image': 'assets/styles/creepy.jpg'},
    {'label': 'Medieval', 'image': 'assets/styles/medieval.jpg'},
    {'label': 'Cyberpunk', 'image': 'assets/styles/cyberpunk.jpeg'},
    {'label': 'Biophilic', 'image': 'assets/styles/biophilic.jpg'},
    {'label': 'Ancient Egyptian', 'image': 'assets/styles/egyptian.jpg'},
    {'label': 'Airbnb', 'image': 'assets/styles/airbnb.jpg'},
    {'label': 'Discotheque', 'image': 'assets/styles/discotheque.jpg'},
    {'label': 'Soho Style', 'image': 'assets/styles/soho.jpg'},
    {'label': 'Rainbow', 'image': 'assets/styles/rainbow.jpg'},
    {'label': 'Luxury', 'image': 'assets/styles/luxury.jpg'},
    {'label': '80s Style', 'image': 'assets/styles/80s.jpg'},
    {'label': 'Wood', 'image': 'assets/styles/wood.jpg'},
    {'label': 'Chocolate', 'image': 'assets/styles/chocolate.jpg'},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Step 3 / 4',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Column(
        children: [
          // Step progress bar
          Container(
            height: 2,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.black)),
                Expanded(child: Container(color: Colors.black)),
                Expanded(child: Container(color: Colors.black)),
                Expanded(child: Container(color: Colors.grey[300])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Style',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select your desired design style to start creating your ideal interior',
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: styles.length,
              itemBuilder: (context, index) {
                final style = styles[index];
                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.red : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                          child: Image.asset(
                            style['image']!,
                            fit: BoxFit.cover,
                            height: 80,
                            cacheWidth: 300,
                            gaplessPlayback: true,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.red : Colors.grey[100],
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(14)),
                          ),
                          child: Text(
                            style['label']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              fontSize: 13,
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
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: selectedIndex != null
                      ? () {
                    final selectedStyle = styles[selectedIndex!]['label'];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateStep4Screen(
                          selectedImage: widget.selectedImage,
                          isAsset: widget.isAsset,
                          selectedRoom: widget.selectedRoom,
                          selectedStyle: selectedStyle!,
                        ),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex != null ? Colors.red : Colors.grey[300],
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
                      color: selectedIndex != null ? Colors.white : Colors.black54,
                    ),
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

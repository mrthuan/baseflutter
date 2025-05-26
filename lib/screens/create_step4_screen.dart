import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/screens/processing_screen.dart';
import 'package:untitled1/screens/result_screen.dart';
import 'package:untitled1/screens/send_interior_request.dart';

class CreateStep4Screen extends StatefulWidget {
  final dynamic selectedImage;
  final bool isAsset;
  final String selectedRoom;
  final String selectedStyle;

  const CreateStep4Screen({
    Key? key,
    required this.selectedImage,
    required this.isAsset,
    required this.selectedRoom,
    required this.selectedStyle,
  }) : super(key: key);

  @override
  State<CreateStep4Screen> createState() => _CreateStep4ScreenState();
}

class _CreateStep4ScreenState extends State<CreateStep4Screen> {
  final List<Map<String, dynamic>> palettes = [
    {
      'label': 'Nordic Calm',
      'colors': [
        Color(0xFFF5F7F8), // soft white
        Color(0xFFDCE3E6), // pale gray-blue
        Color(0xFFB2BEC3), // cool gray
        Color(0xFF7F8C8D), // warm gray
        Color(0xFF596E79), // deep slate
      ],
    },
    {
      'label': 'Café Earth',
      'colors': [
        Color(0xFFF3E9DD), // cream beige
        Color(0xFFD6BAA3), // milk coffee
        Color(0xFFAC7F6A), // mocha
        Color(0xFF815B47), // dark roast
        Color(0xFF5E4034), // espresso
      ],
    },
    {
      'label': 'Tech Minimal',
      'colors': [
        Color(0xFFFFFFFF), // white
        Color(0xFFF2F2F2), // off-white
        Color(0xFFCCCCCC), // silver
        Color(0xFF999999), // mid gray
        Color(0xFF1A1A1A), // black
      ],
    },
    {
      'label': 'Retro Pop',
      'colors': [
        Color(0xFFFFF275), // yellow pop
        Color(0xFFFF8C42), // orange retro
        Color(0xFFEA526F), // raspberry red
        Color(0xFF663399), // purple vinyl
        Color(0xFF2EC4B6), // turquoise
      ],
    },
    {
      'label': 'Muted Elegance',
      'colors': [
        Color(0xFFEFEFEF), // pearl
        Color(0xFFDADADA), // stone
        Color(0xFFB4B4B4), // warm gray
        Color(0xFF969696), // graphite
        Color(0xFF5C5C5C), // deep gray
      ],
    },
    {
      'label': 'Coastal Sand',
      'colors': [
        Color(0xFFFFFAF0), // sandy white
        Color(0xFFF7E9D7), // light tan
        Color(0xFFE0C6AC), // beachwood
        Color(0xFFBFA78A), // driftwood
        Color(0xFF8B7D6B), // seashell brown
      ],
    },
    {
      'label': 'Millennial Gray',
      'colors': [
        Color(0xFFF2F2F2),
        Color(0xFFD6D6D6),
        Color(0xFFB5B5B5),
        Color(0xFF8A8A8A),
        Color(0xFF4D4D4D)
      ],
    },
    {
      'label': 'Terracotta Mirage',
      'colors': [
        Color(0xFFFFE7DC),
        Color(0xFFFFC8B3),
        Color(0xFFFFA07A),
        Color(0xFFE36D5C),
        Color(0xFFB84836)
      ],
    },
    {
      'label': 'Neon Sunset',
      'colors': [
        Color(0xFFFF00FF),
        Color(0xFFFF66CC),
        Color(0xFFFFFF00),
        Color(0xFFFF9900),
        Color(0xFFFF3300)
      ],
    },
    {
      'label': 'Forest Hues',
      'colors': [
        Color(0xFFE4EFDF),
        Color(0xFFC9D7B2),
        Color(0xFFA3C28F),
        Color(0xFF7BAE69),
        Color(0xFF4F8B45)
      ],
    },
    {
      'label': 'Peach Orchard',
      'colors': [
        Color(0xFFFFF6F1),
        Color(0xFFFFE3D4),
        Color(0xFFFFC2AA),
        Color(0xFFFF9D7D),
        Color(0xFFE7754E)
      ],
    },
    {
      'label': 'Fuschia Blossom',
      'colors': [
        Color(0xFFFFD1E8),
        Color(0xFFFFA8D1),
        Color(0xFFFF7EB9),
        Color(0xFFFF509F),
        Color(0xFFDB317F)
      ],
    },
    {
      'label': 'Emerald Gem',
      'colors': [
        Color(0xFFD7F5DF),
        Color(0xFFAAEBC0),
        Color(0xFF7DDBA3),
        Color(0xFF4CCB87),
        Color(0xFF2B9C6E)
      ],
    },
    {
      'label': 'Pastel Breeze',
      'colors': [
        Color(0xFFE6F7FA),
        Color(0xFFD0F0F8),
        Color(0xFFB8E8F5),
        Color(0xFFA2DFF2),
        Color(0xFF8AD5EF)
      ],
    },
    {
      'label': 'Velvet Dusk',
      'colors': [
        Color(0xFF3B2C35),
        Color(0xFF5A4250),
        Color(0xFF7A5B6B),
        Color(0xFF9C7486),
        Color(0xFFC08DA1)
      ],
    },
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text('Step 4 / 4',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step bar
          Container(
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: List.generate(
                4,
                    (index) =>
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        margin: index != 3 ? EdgeInsets.only(right: 4) : null,
                      ),
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
            child: Text('Select Palette',
                style: GoogleFonts.outfit(
                    fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
            child: Text(
              'Choose a color palette to bring your vision to life!\nSelect from curated shades to transform your space.',
              style: GoogleFonts.outfit(
                  fontSize: 13, color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: palettes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final palette = palettes[index];
                      final isSelected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? Colors.red : Colors
                                  .transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(14)),
                                  child: Row(
                                    children: (palette['colors'] as List<Color>)
                                        .map((color) {
                                      return Expanded(
                                        child: Container(color: color),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(14)),
                                ),
                                child: Text(
                                  palette['label'],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.outfit(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
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
                // Fixed continue button
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () async {
                          final selectedPalette = palettes[selectedIndex!]['label'];

                          // 1. Hiển thị màn hình Processing
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ProcessingScreen()),
                          );

                          try {
                            // 2. Đọc ảnh đã chọn (file hoặc asset)
                            final bytes = widget.isAsset
                                ? (await rootBundle.load(widget.selectedImage)).buffer.asUint8List()
                                : await widget.selectedImage.readAsBytes();

                            final base64Image = 'data:image/png;base64,${base64Encode(bytes)}';

                            // 3. Gửi request đến Modelslab
                            final imageUrl = await sendInteriorRequest(
                              apiKey: 'lCUCFWNKmYIC15BKgvhOBZ4aqtvZsf3GblSFZzbKpRBzCKqSzughASjYy5o0',
                              modelId: 'anything-v5',
                              prompt:
                              '${widget.selectedRoom}, ${widget.selectedStyle} style, $selectedPalette palette, modern interior design',
                              negativePrompt: 'blurry, distorted, low quality, wrong perspective',
                              initImageBase64: base64Image,
                              width: 512,
                              height: 768,
                            );

                            // 4. Điều hướng sang kết quả
                            if (imageUrl != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ResultScreen(resultImageUrl: imageUrl),
                                ),
                              );
                            } else {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Failed to process image. Try again.')),
                              );
                            }
                          } catch (e) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e')),
                            );
                          }
                        }
                             ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedIndex != null
                              ? Colors.red
                              : Colors.grey[300],
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
                            color: selectedIndex != null ? Colors.white : Colors
                                .black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
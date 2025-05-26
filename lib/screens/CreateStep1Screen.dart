import 'dart:io';
import 'dart:ui' as BorderType;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'CreateStep2Screen.dart';


class CreateStep1Screen extends StatefulWidget {
  @override
  _CreateStep1ScreenState createState() => _CreateStep1ScreenState();
}

class _CreateStep1ScreenState extends State<CreateStep1Screen> {
  dynamic _selectedImage; // Có thể là File hoặc String (Asset path)
  bool _isAsset = false;
  final picker = ImagePicker();

  final List<String> sampleImages = List.generate(
    6,
        (index) => 'assets/images/sample$index.png',
  );

  Future<void> _requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();

    if (cameraStatus.isDenied || storageStatus.isDenied) {
      _showPermissionDialog();
    }

    if (cameraStatus.isPermanentlyDenied || storageStatus.isPermanentlyDenied) {
      _showPermissionDialog(permanent: true);
    }
  }

  void _showPermissionDialog({bool permanent = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permissions Required'),
        content: Text(
          permanent
              ? 'You have permanently denied permissions. Please enable them in app settings.'
              : 'Camera and storage permissions are needed to proceed.',
          style: GoogleFonts.outfit(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: GoogleFonts.outfit()),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: Text('Open Settings', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isAsset = false;
      });
    }
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 16),
            Text('Select Media Source',
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.photo_camera, color: Colors.black),
              title: Text('Take photo from camera', style: GoogleFonts.outfit()),
              onTap: () => _pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Colors.black),
              title: Text('Choose from gallery', style: GoogleFonts.outfit()),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedImagePreview() {
    if (_selectedImage == null) return _buildPlaceholder();

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: _isAsset
          ? Image.asset(
        _selectedImage,
        fit: BoxFit.cover,
        width: double.infinity,
      )
          : Image.file(
        _selectedImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Start Redesigning',
            style: GoogleFonts.outfit(
                fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Redesign and beautify your home',
            style: GoogleFonts.outfit(
                fontSize: 14, color: Colors.grey[700])),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: _showImageSourceDialog,
          icon: Icon(Icons.add, size: 18, color: Colors.white),
          label: Text('Add a Photo',
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600, color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Step 1 / 4',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 2,
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 8),
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.black)),
                  Expanded(child: Container(color: Colors.grey[300])),
                  Expanded(child: Container(color: Colors.grey[300])),
                  Expanded(child: Container(color: Colors.grey[300])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Add a Photo',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            GestureDetector(
              onTap: _showImageSourceDialog,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: DottedBorder(
                  color: Colors.grey.shade400,
                  strokeWidth: 1,
                  radius: Radius.circular(16),
                  dashPattern: [6, 4],
                  child: Container(
                    height: 260,
                    width: double.infinity,
                    child: _selectedImage != null
                        ? _buildSelectedImagePreview()
                        : _buildPlaceholder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Text(
                'Example Photos',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: sampleImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImage = sampleImages[index]; // asset path
                        _isAsset = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(sampleImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: ElevatedButton(
          onPressed: _selectedImage != null
              ? () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateStep2Screen(
                  selectedImage: _selectedImage,
                  isAsset: _isAsset,
                ),
              ),
            );
          }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedImage != null ? Colors.red : Colors.grey[300],
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
              color: _selectedImage != null ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

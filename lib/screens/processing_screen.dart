// 📁 lib/screens/processing_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcessingScreen extends StatelessWidget {
  const ProcessingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircularProgressIndicator(
                        strokeWidth: 6,
                        color: Colors.redAccent,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade100,
                        child: Image.asset('assets/images/sofa.png', width: 40),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Processing...',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "We're transforming your space with AI magic. Hang tight!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Please don't close the app or lock your device",
                    style: GoogleFonts.outfit(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

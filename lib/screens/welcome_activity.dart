import 'package:flutter/material.dart';

class WelcomeActivity extends StatelessWidget {
  const WelcomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('uiux/welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(32.0),
          color: Colors.black45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Thank you for installing our app',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/main.dart
import 'dart:html' as html;
import 'dart:ui'; // Required for ImageFilter.blur
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  _insertBackgroundVideo();
}

void _insertBackgroundVideo() {
  final video = html.VideoElement()
    ..src = 'assets/video/bg.mp4'
    ..autoplay = true
    ..loop = true
    ..muted = true
    ..playbackRate = 1.0
    ..setAttribute('playsinline', 'true')
    ..style.position = 'fixed'
    ..style.left = '0'
    ..style.top = '0'
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.objectFit = 'cover'
    ..style.zIndex = '-1'
    ..style.pointerEvents = 'none';

  html.document.body!.append(video);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Video Demo 33333 ',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            // ---------- Top-right buttons ----------
            Positioned(
              top: 20,
              right: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _topButton('Home', () {}),
                  const SizedBox(width: 12),
                  _topButton('About', () {}),
                  const SizedBox(width: 12),
                  _topButton('Pricing', () {}),
                  const SizedBox(width: 12),
                  _topButton('Contact', () {}),
                ],
              ),
            ),

            // ---------- Center content ----------
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                constraints: const BoxConstraints(maxWidth: 1000),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.12)),
                      ),
                      child: const Text(
                        'XAUUSD Dataset Store — background video is playing',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Helper function to create a top-right button ----------
  Widget _topButton(String text, VoidCallback onPressed) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(30),
            border:
                Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

// lib/widgets/background_widget.dart

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Lingkaran gradien ungu di kiri atas
        Positioned(
          top: -100,
          left: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFB379DF).withOpacity(0.4),
                  const Color(0xFF151316).withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),
        // Lingkaran gradien oranye di kanan bawah
        Positioned(
          bottom: -150,
          right: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFC45647).withOpacity(0.4),
                  const Color(0xFF151316).withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


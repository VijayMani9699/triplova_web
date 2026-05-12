import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/theme/app_colors.dart';
import 'search_box.dart';

class HeroSection extends StatelessWidget {
  final String imageUrl;

  const HeroSection({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final heroHeight = isMobile ? size.height * 0.75 : size.height * 0.92;

    return SizedBox(
      height: heroHeight,
      width: size.width,
      child: Stack(
        children: [
          // Background Image
          SizedBox(
            height: heroHeight,
            width: size.width,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(color: AppColors.primaryDark);
              },
            ),
          ),

          // Gradient Overlays
          Container(
            height: heroHeight,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(150),
                  Colors.transparent,
                  Colors.black.withAlpha(180),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 75), // Balanced spacing

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Luxury Travel\nRedefined.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: isMobile ? 42 : 72, // Slightly reduced for smaller header
                          height: 1.1,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.1),
                      const SizedBox(height: 24),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          'Discover hidden paradises tailored for the world\'s most discerning travelers.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withAlpha(200),
                            fontSize: isMobile ? 16 : 18,
                            height: 1.6,
                          ),
                        ),
                      ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Search Box
                  const SearchBox()
                      .animate()
                      .fadeIn(delay: 600.ms, duration: 800.ms)
                      .slideY(begin: 0.2),
                  
                  const SizedBox(height: 60),

                  // Bottom Scroll Indicator
                  if (!isMobile)
                    const Column(
                      children: [
                        Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 28),
                        Text(
                          'SCROLL TO DISCOVER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .slideY(begin: 0.1, end: 0.2, duration: 1.seconds),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

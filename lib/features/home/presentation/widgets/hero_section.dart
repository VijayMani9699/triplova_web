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

    return Stack(
      children: [
        // Background Image
        SizedBox(
          height: size.height,
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
          height: size.height,
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(50),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primary.withAlpha(100)),
                ),
                child: const Text(
                  'EXPLORE THE EXTRAORDINARY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),

              const SizedBox(height: 24),

              // Title
              Text(
                'Luxury Travel\nRedefined.',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: isMobile ? 48 : 84,
                  height: 1.1,
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.1),

              const SizedBox(height: 32),

              // Subtitle
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Discover hidden paradises and curated experiences tailored for the world\'s most discerning travelers.',
                  style: TextStyle(
                    color: Colors.white.withAlpha(200),
                    fontSize: isMobile ? 16 : 20,
                    height: 1.6,
                  ),
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 800.ms),

              const SizedBox(height: 48),

              // Search Box
              const SearchBox()
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 800.ms)
                  .slideY(begin: 0.2),
              
              const SizedBox(height: 40),

              // Bottom Scroll Indicator (Optional)
              if (!isMobile)
                const Column(
                  children: [
                    Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 32),
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
      ],
    );
  }
}

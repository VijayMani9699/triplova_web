import 'dart:ui';
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
              const SizedBox(height: 75),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text Content
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),

                  // Modern Floating Card (Desktop only)
                  if (!isMobile)
                    Expanded(
                      flex: 2,
                      child: _buildModernHeroCard(context),
                    ),
                ],
              ),

              const SizedBox(height: 48),

              // Search Box
              const SearchBox()
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 800.ms)
                  .slideY(begin: 0.2),
              
              const SizedBox(height: 40),

              // Bottom Scroll Indicator
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

  Widget _buildModernHeroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(26),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withAlpha(51)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.star, color: Colors.white, size: 20),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Rated Agency',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4.9/5 Average Rating',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Trusted by over 50k+ travelers worldwide for curated luxury experiences.',
                style: TextStyle(color: Colors.white, height: 1.5, fontSize: 16),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem('500+', 'Destinations'),
                  _buildStatItem('12k+', 'Bookings'),
                  _buildStatItem('24/7', 'Support'),
                ],
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.2);
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
      ],
    );
  }
}

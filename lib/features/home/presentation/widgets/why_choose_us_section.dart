import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/theme/app_colors.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.footerBg, // Premium Deep Navy Blue background
      ),
      child: Stack(
        children: [
          // Bottom Ice Mountains Overlay with modern fade-in blending
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: isMobile ? 250 : 400,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha(150),
                    Colors.black.withAlpha(220),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstIn,
              child: Image.network(
                'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=2000&auto=format&fit=crop',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                opacity: const AlwaysStoppedAnimation(0.85),
              ),
            ),
          ),

          // Main Content Layer
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 60 : 100,
            ),
            child: isMobile || isTablet
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLeftContent(context, isMobile),
                      const SizedBox(height: 60),
                      _buildRightContent(context, isMobile),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildLeftContent(context, false),
                      ),
                      const SizedBox(width: 80),
                      Expanded(
                        flex: 5,
                        child: _buildRightContent(context, false),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Highlight Sub-header
        Text(
          'WHY GO WITH TRIPLOVA',
          style: TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            fontSize: isMobile ? 12 : 14,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1),
        
        const SizedBox(height: 16),
        
        // Main Title
        Text(
          'Experience Hassle-free, Unforgettable Travel Journeys With Expert Guidance',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 28 : 42,
            height: 1.2,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.1),
        
        const SizedBox(height: 20),
        
        // Description
        Text(
          'We handle every detail of your itinerary, ensuring a smooth and stress-free start to your premium journey.',
          style: TextStyle(
            color: Colors.white.withAlpha(200),
            fontSize: isMobile ? 15 : 18,
            height: 1.5,
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
        
        const SizedBox(height: 48),
        
        // Features Grid
        LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 500;
            return GridView.count(
              crossAxisCount: isSmall ? 1 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: isSmall ? 3.5 : 2.5,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              children: [
                _buildFeatureItem(
                  icon: Icons.person_outline,
                  title: 'Expert Guidance',
                  description: 'Our travel team knows exactly what documents and options you need, helping avoid delays.',
                ),
                _buildFeatureItem(
                  icon: Icons.local_offer_outlined,
                  title: 'Best Price Guarantee',
                  description: 'Competitive pricing, no hidden charges. Get full value for your investment with every curated tour.',
                ),
                _buildFeatureItem(
                  icon: Icons.headset_mic_outlined,
                  title: '24/7 Support',
                  description: 'Got questions at midnight? No problem. Our premium support team is always available to assist you.',
                ),
                _buildFeatureItem(
                  icon: Icons.star_border,
                  title: 'Curated Experiences',
                  description: 'We recommend the perfect options tailored to your purpose—leisure, business, or adventure.',
                ),
              ],
            );
          },
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.gold.withAlpha(25),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.gold.withAlpha(80)),
          ),
          child: Icon(icon, color: AppColors.gold, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withAlpha(160),
                  fontSize: 13,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context, bool isMobile) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(80),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1501555088652-021faa106b9b?q=80&w=1000&auto=format&fit=crop',
                fit: BoxFit.cover,
                height: isMobile ? 300 : 450,
                width: double.infinity,
              ),
              // Modern Glassmorphism Overlay overlaying the bottom of the image
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withAlpha(200),
                      ],
                    ),
                  ),
                  
                ),
              ),
            ],
          ),
        ),
      ).animate().scale(delay: 400.ms, duration: 800.ms, curve: Curves.easeOutQuart),
    );
  }
}

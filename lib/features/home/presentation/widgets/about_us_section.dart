import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      color: theme.brightness == Brightness.dark 
          ? AppColors.darkSurface 
          : AppColors.lightBg.withAlpha(200),
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        children: [
          // Image Side
          Expanded(
            flex: isDesktop ? 1 : 0,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1530789253388-582c481c54b0?q=80&w=1200&auto=format&fit=crop',
                    fit: BoxFit.cover,
                    height: isDesktop ? 500 : 300,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 24,
                  right: 24,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          '15+',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Years Exp.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          if (isDesktop) const SizedBox(width: 80),
          if (!isDesktop) const SizedBox(height: 48),

          // Text Side
          Expanded(
            flex: isDesktop ? 1 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ABOUT TRIPLOVA',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We Craft Experiences\nThat Last A Lifetime',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Triplova is a boutique luxury travel agency dedicated to uncovering the world\'s most extraordinary destinations. We believe that travel is not just about visiting places, but about the stories you bring back.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade600,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                _buildBenefitItem(Icons.verified_user_outlined, 'Certified Luxury Travel Experts'),
                _buildBenefitItem(Icons.support_agent_outlined, '24/7 Premium Concierge Service'),
                _buildBenefitItem(Icons.card_giftcard_outlined, 'Handpicked Exclusive Packages'),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Read Our Story'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

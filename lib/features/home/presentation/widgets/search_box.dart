import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final luxury = theme.extension<LuxuryThemeExtension>()!;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    if (isMobile) {
      return _buildMobileSearch(context, luxury);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: luxury.blur, sigmaY: luxury.blur),
        child: Container(
          padding: const EdgeInsets.all(12),
          constraints: const BoxConstraints(maxWidth: 900),
          decoration: BoxDecoration(
            color: luxury.glassColor,
            border: Border.all(color: luxury.glassBorder),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              _buildSearchField(Icons.location_on_outlined, 'Location', 'Where to?'),
              _buildDivider(),
              _buildSearchField(Icons.calendar_month_outlined, 'Check-in', 'Add dates'),
              _buildDivider(),
              _buildSearchField(Icons.people_outline, 'Guests', 'Add guests'),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Text('Search', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileSearch(BuildContext context, LuxuryThemeExtension luxury) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildSearchField(Icons.location_on_outlined, 'Location', 'Where to?'),
          const Divider(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Search Destinations'),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(IconData icon, String label, String placeholder) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: AppColors.primary),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              placeholder,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.withAlpha(50),
    );
  }
}

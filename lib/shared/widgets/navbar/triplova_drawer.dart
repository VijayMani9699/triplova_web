import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class TriplovaDrawer extends StatelessWidget {
  const TriplovaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark ? AppColors.darkBg : AppColors.lightBg,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                'TRIPLOVA',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          _buildDrawerItem(context, 'Home', isSelected: true),
          _buildDrawerItem(context, 'Destinations'),
          _buildDrawerItem(context, 'Experiences'),
          _buildDrawerItem(context, 'About Us'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'BOOK NOW',
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, {bool isSelected = false}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected ? AppColors.primary : null,
        ),
      ),
      onTap: () => Navigator.pop(context),
      selected: isSelected,
      contentPadding: const EdgeInsets.symmetric(horizontal: 32),
    );
  }
}

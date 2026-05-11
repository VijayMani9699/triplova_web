import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const NavItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: widget.isActive || _isHovered ? FontWeight.w600 : FontWeight.w500,
                  color: widget.isActive 
                      ? AppColors.primary 
                      : (isDark ? AppColors.darkText : AppColors.lightText).withAlpha(_isHovered ? 255 : 204),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: 300.ms,
                height: 2,
                width: _isHovered || widget.isActive ? 24 : 0,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

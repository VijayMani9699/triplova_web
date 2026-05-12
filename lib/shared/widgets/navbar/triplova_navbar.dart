import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'nav_item.dart';

class TriplovaNavbar extends StatefulWidget {
  final ScrollController scrollController;

  const TriplovaNavbar({
    super.key,
    required this.scrollController,
  });

  @override
  State<TriplovaNavbar> createState() => _TriplovaNavbarState();
}

class _TriplovaNavbarState extends State<TriplovaNavbar> {
  double _scrollOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;
    setState(() {
      _scrollOpacity = (offset / 100).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final luxury = theme.extension<LuxuryThemeExtension>()!;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return AnimatedContainer(
      duration: 300.ms,
      height: 80,
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBg : AppColors.lightBg)
            .withAlpha((_scrollOpacity * 255 * 0.8).round()),
        border: Border(
          bottom: BorderSide(
            color: (isDark ? Colors.white : Colors.black)
                .withAlpha((_scrollOpacity * 25).round()),
            width: 1,
          ),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: _scrollOpacity * luxury.blur,
            sigmaY: _scrollOpacity * luxury.blur,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 40,
            ),
            child: Row(
              children: [
                // Logo
                Text(
                  'TRIPLOVA',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    color: AppColors.primary,
                  ),
                ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.2),

                const Spacer(),

                // Desktop Nav Items
                if (!isMobile)
                  Row(
                    children: [
                      NavItem(title: 'Home', onTap: () {}, isActive: true),
                      NavItem(title: 'Tours', onTap: () {}),
                      NavItem(title: 'Contact Us', onTap: () {}),
                      NavItem(title: "FAQ's", onTap: () {}),
                      const SizedBox(width: 20),
                      // CTA Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          elevation: 0,
                        ),
                        child: const Text('Login/Signup'),
                      ).animate().scale(delay: 200.ms),
                    ],
                  ),

                // Mobile Menu Icon
                if (isMobile)
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../shared/widgets/navbar/triplova_navbar.dart';
import '../../../../shared/widgets/navbar/triplova_drawer.dart';
import '../../../../core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const TriplovaDrawer(),
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero Section Placeholder
                Container(
                  height: 800,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryDark, AppColors.primary],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Experience the World',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Curated luxury travels for the modern explorer.',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Content to enable scrolling
                Container(
                  height: 1200,
                  width: double.infinity,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Center(
                    child: Text('Scroll down to see Navbar blur effect'),
                  ),
                ),
              ],
            ),
          ),

          // Navbar (Sticky)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TriplovaNavbar(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}

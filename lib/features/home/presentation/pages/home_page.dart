import 'package:flutter/material.dart';
import '../../../../shared/widgets/navbar/triplova_navbar.dart';
import '../../../../shared/widgets/navbar/triplova_drawer.dart';
import '../widgets/hero_section.dart';
import '../widgets/destination_card.dart';
import '../widgets/about_us_section.dart';
import '../../domain/models/destination.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
                // Hero Section
                const HeroSection(
                  imageUrl: 'https://images.unsplash.com/photo-1544918877-460635b6d13e?q=80&w=2000&auto=format&fit=crop',
                ),
                // Destinations Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Destinations',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Discover the world\'s most breathtaking locations curated just for you.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(height: 40),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _getCrossAxisCount(context),
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 32,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: Destination.mockDestinations.length,
                        itemBuilder: (context, index) {
                          return DestinationCard(
                            destination: Destination.mockDestinations[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const AboutUsSection(),

                const SizedBox(height: 100),
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

  int _getCrossAxisCount(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isDesktop) return 4;
    if (ResponsiveBreakpoints.of(context).isTablet) return 2;
    return 1;
  }
}

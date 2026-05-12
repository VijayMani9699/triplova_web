import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/navbar/triplova_navbar.dart';
import '../../../../shared/widgets/navbar/triplova_drawer.dart';
import '../widgets/hero_section.dart';
import '../widgets/destination_card.dart';
import '../widgets/why_choose_us_section.dart';
import '../widgets/faq_section.dart';
import '../../../../shared/widgets/footer/triplova_footer.dart';
import '../../domain/models/destination.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'All';
  String _selectedRegion = 'All';
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
                      // Centered Header with Flight Logo
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'TRENDY TRAVEL DESTINATIONS',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1.5,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.flight_takeoff,
                                  color: AppColors.primary,
                                  size: 28,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Explore Our Most Popular Destinations, Tailored For Every Traveler',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.grey.shade600,
                                      height: 1.5,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      // Categories Row & See More Button
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isMobile = ResponsiveBreakpoints.of(context).isMobile;
                          
                          final categories = ['All', 'Trending', 'Express', 'Cheapest'];
                          
                          final categoryWidgets = categories.map((cat) {
                            final isSelected = _selectedCategory == cat;
                            return Padding(
                              padding: const EdgeInsets.only(right: 12, bottom: 8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = cat;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primary : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected ? AppColors.primary : Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    cat,
                                    style: TextStyle(
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : (Theme.of(context).brightness == Brightness.dark
                                              ? Colors.white70
                                              : Colors.black87),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList();

                          final seeMoreButton = TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'See More',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_forward_ios, size: 14),
                              ],
                            ),
                          );

                          if (isMobile) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: categoryWidgets),
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: seeMoreButton,
                                ),
                              ],
                            );
                          }

                          return Row(
                            children: [
                              Expanded(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: categoryWidgets,
                                ),
                              ),
                              seeMoreButton,
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _getCrossAxisCount(context),
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 32,
                          childAspectRatio: 0.7,
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
                const WhyChooseUsSection(),
                // Regional Destinations Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Centered Header with Plane Logo
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'TRENDY TRAVEL DESTINATIONS',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1.5,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.flight,
                                  color: AppColors.primary,
                                  size: 28,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Explore Our Most Popular Destinations, Tailored For Every Traveler',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.grey.shade600,
                                      height: 1.5,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      // Regional Categories Row & See More Button
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isMobile = ResponsiveBreakpoints.of(context).isMobile;
                          
                          final regions = ['All', 'Asia', 'Europe', 'Africa', 'India'];
                          
                          final regionWidgets = regions.map((reg) {
                            final isSelected = _selectedRegion == reg;
                            return Padding(
                              padding: const EdgeInsets.only(right: 12, bottom: 8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  setState(() {
                                    _selectedRegion = reg;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primary : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected ? AppColors.primary : Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    reg,
                                    style: TextStyle(
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : (Theme.of(context).brightness == Brightness.dark
                                              ? Colors.white70
                                              : Colors.black87),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList();

                          final seeMoreButton = TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'See More',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_forward_ios, size: 14),
                              ],
                            ),
                          );

                          if (isMobile) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: regionWidgets),
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: seeMoreButton,
                                ),
                              ],
                            );
                          }

                          return Row(
                            children: [
                              Expanded(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: regionWidgets,
                                ),
                              ),
                              seeMoreButton,
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      Builder(
                        builder: (context) {
                          final filteredDestinations = Destination.mockDestinations.where((d) {
                            if (_selectedRegion == 'All') return true;
                            if (_selectedRegion == 'Asia') {
                              return d.location.contains('Maldives') || d.location.contains('Japan') || d.location.contains('Indonesia');
                            }
                            if (_selectedRegion == 'Europe') {
                              return d.location.contains('Switzerland') || d.location.contains('Greece') || d.location.contains('Italy');
                            }
                            return true;
                          }).toList();

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: _getCrossAxisCount(context),
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 32,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: filteredDestinations.length,
                            itemBuilder: (context, index) {
                              return DestinationCard(
                                destination: filteredDestinations[index],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const FaqSection(),
                const TriplovaFooter(),
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

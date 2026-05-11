import 'package:flutter/material.dart';
import '../../../../shared/widgets/navbar/triplova_navbar.dart';
import '../../../../shared/widgets/navbar/triplova_drawer.dart';
import '../widgets/hero_section.dart';

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
                  imageUrl: 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?q=80&w=2000&auto=format&fit=crop',
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

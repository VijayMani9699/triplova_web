class Destination {
  final String title;
  final String location;
  final String imageUrl;
  final double rating;
  final double pricePerNight;
  final String category;

  Destination({
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.pricePerNight,
    required this.category,
  });

  static List<Destination> get mockDestinations => [
        Destination(
          title: 'Maldives Overwater Bliss',
          location: 'South Male Atoll, Maldives',
          imageUrl: 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?q=80&w=800&auto=format&fit=crop',
          rating: 4.9,
          pricePerNight: 1250,
          category: 'Tropical',
        ),
        Destination(
          title: 'Swiss Alpine Retreat',
          location: 'Zermatt, Switzerland',
          imageUrl: 'https://images.unsplash.com/photo-1502784444187-359ac186c5bb?q=80&w=800&auto=format&fit=crop',
          rating: 4.8,
          pricePerNight: 850,
          category: 'Mountains',
        ),
        Destination(
          title: 'Santorini Sunset Villa',
          location: 'Oia, Greece',
          imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?q=80&w=800&auto=format&fit=crop',
          rating: 4.95,
          pricePerNight: 980,
          category: 'Coastal',
        ),
        Destination(
          title: 'Kyoto Zen Garden Inn',
          location: 'Kyoto, Japan',
          imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?q=80&w=800&auto=format&fit=crop',
          rating: 4.7,
          pricePerNight: 420,
          category: 'Cultural',
        ),
        Destination(
          title: 'Amalfi Coast Haven',
          location: 'Positano, Italy',
          imageUrl: 'https://images.unsplash.com/photo-1533929736458-ca588d08c8be?q=80&w=800&auto=format&fit=crop',
          rating: 4.85,
          pricePerNight: 1100,
          category: 'Luxury',
        ),
        Destination(
          title: 'Bali Rainforest Lodge',
          location: 'Ubud, Indonesia',
          imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=800&auto=format&fit=crop',
          rating: 4.6,
          pricePerNight: 350,
          category: 'Nature',
        ),
      ];
}

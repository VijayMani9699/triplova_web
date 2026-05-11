class TravelPackage {
  final String id;
  final String title;
  final String location;
  final List<String> images;
  final double rating;
  final int reviewsCount;
  final double price;
  final String description;
  final List<String> highlights;
  final List<ItineraryDay> itinerary;
  final HotelDetail hotel;

  TravelPackage({
    required this.id,
    required this.title,
    required this.location,
    required this.images,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.description,
    required this.highlights,
    required this.itinerary,
    required this.hotel,
  });

  static TravelPackage get mock => TravelPackage(
        id: '1',
        title: 'Maldives Luxury Escape',
        location: 'North Male Atoll, Maldives',
        images: [
          'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?q=80&w=1200&auto=format&fit=crop',
          'https://images.unsplash.com/photo-1544918877-460635b6d13e?q=80&w=1200&auto=format&fit=crop',
          'https://images.unsplash.com/photo-1506929113670-843b81f8d28c?q=80&w=1200&auto=format&fit=crop',
        ],
        rating: 4.9,
        reviewsCount: 128,
        price: 2499,
        description:
            'Indulge in a 5-day retreat at one of the world\'s most exclusive overwater villas. Experience private dining, sunset cruises, and world-class spa treatments.',
        highlights: [
          'Private overwater villa with infinity pool',
          'Sunset yacht cruise with champagne',
          'Guided snorkeling in coral reefs',
          'Daily gourmet breakfast & 5-course dinner',
          'Traditional Maldivian spa treatment',
        ],
        itinerary: [
          ItineraryDay(
            day: 1,
            title: 'Arrival & Welcome',
            description: 'Transfer from Male Airport by seaplane and check-in to your villa.',
          ),
          ItineraryDay(
            day: 2,
            title: 'Ocean Exploration',
            description: 'Guided snorkeling tour followed by a private beach dinner.',
          ),
          ItineraryDay(
            day: 3,
            title: 'Wellness & Relaxation',
            description: 'Morning yoga on the deck and 90-minute spa treatment.',
          ),
          ItineraryDay(
            day: 4,
            title: 'Sunset Cruise',
            description: 'Enjoy a luxury yacht cruise with dolphin watching at sunset.',
          ),
          ItineraryDay(
            day: 5,
            title: 'Departure',
            description: 'Final breakfast and transfer back to the airport.',
          ),
        ],
        hotel: HotelDetail(
          name: 'Waldorf Astoria Maldives',
          imageUrl:
              'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=800&auto=format&fit=crop',
          rating: 5.0,
          amenities: ['Private Pool', 'Ocean View', 'Butler Service', 'Fitness Center'],
        ),
      );
}

class ItineraryDay {
  final int day;
  final String title;
  final String description;

  ItineraryDay({required this.day, required this.title, required this.description});
}

class HotelDetail {
  final String name;
  final String imageUrl;
  final double rating;
  final List<String> amenities;

  HotelDetail({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.amenities,
  });
}

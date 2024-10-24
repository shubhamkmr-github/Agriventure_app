import 'package:flutter/material.dart';
import 'booking_screen.dart';
import 'package:share_plus/share_plus.dart';

class PlanScreen extends StatelessWidget {
  // Sample data for multiple locations
  final List<Map<String, String>> locations = [
    {
      'image': 'assets/shimla.jpg',
      'title': '3785 Raj Res..',
      'location': 'Beolia, Shimla, Himachal Pradesh 172009',
      'description':
      'The paid guest in the village room might feel either comfort '
          'and coziness if the accommodations are well-maintained, or '
          'discomfort and isolation if the room lacks cleanliness or '
          'amenities and is situated away from the village community.',
    },
    {
      'image': 'assets/location2.jpg', // Replace with your actual image asset
      'title': 'Mountain tea plantation',
      'location': 'Hilltop, Manali, Himachal Pradesh',
      'description':
      'Enjoy breathtaking views and serene surroundings at this beautiful resort.',
    },
    {
      'image': 'assets/location3.jpg', // Replace with your actual image asset
      'title': 'Beach fishing',
      'location': 'Coastal Road, Goa',
      'description':
      'Experience the best sunsets and beach vibes at this stunning beach house.',
    },
    // Add more locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Your Next Trip'),
        backgroundColor: Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final location = locations[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                          image: AssetImage(location['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Title and Location
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            location['title']!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(Icons.location_on, color: Colors.green),
                        Expanded(
                          child: Text(
                            location['location']!,
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Review Stars
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(Icons.star, color: Colors.green, size: 16);
                      }),
                    ),
                    SizedBox(width: 8),
                    Text('Review'), // You can replace this with actual review data
                    SizedBox(height: 16),

                    // Description
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(location['description']!),
                    SizedBox(height: 16),

                    // Book Now Button
                    ElevatedButton(
                      onPressed: () {
                        // Action for booking
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingScreen(),
                          ),
                        );
                      },
                      child: Text('Book Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Icons for Share and Favorite
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.share, color: Colors.grey),
                          onPressed: () {
                            final String textToShare = 'Check out this awesome content!';
                            // Use Share plugin to share
                            Share.share(textToShare);
                            // Action for sharing
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border, color: Colors.grey),
                          onPressed: () {
                            // Action for favorite
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

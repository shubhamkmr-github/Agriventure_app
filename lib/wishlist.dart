import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // Dummy data representing the trips
  final List<Map<String, String>> likedTrips = [
    {
      'title': 'Mountain Paradise',
      'location': 'Shimla, Himachal Pradesh',
      'image': 'assets/location2.jpg',
    },
    {
      'title': 'Mountain shimla',
      'location': 'shimla',
      'image': 'assets/shimla.jpg',
    },
    {
      'title': 'Tea plantatons',
      'location': 'Karnataka',
      'image': 'assets/kashmir.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Color(0xFF4CAF50), // Match your primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: likedTrips.length,
          itemBuilder: (context, index) {
            final trip = likedTrips[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 4, // Add elevation for shadow effect
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Trip Image
                  ClipRRect(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      trip['image']!,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Trip Details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trip['title']!,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4CAF50), // Match your primary color
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          trip['location']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Delete Button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          // Remove the trip from the wishlist
                          setState(() {
                            likedTrips.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

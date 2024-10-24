import 'package:flutter/material.dart';
import 'trip_details_screen.dart'; // Import your TripDetailsScreen

class HomePage extends StatelessWidget {
  // Define lists for the Popular Trip section
  final List<Map<String, String>> popularTrips = [
    {
      'imageUrl': 'assets/munnar.jpg',
      'tripName': 'Munnar',
      'location': 'Kerala',
    },
    {
      'imageUrl': 'assets/goa.jpg',
      'tripName': 'Manglore',
      'location': 'Karnataka',
    },
    {
      'imageUrl': 'assets/shimla.jpg',
      'tripName': 'Shimla',
      'location': 'Himachal Pradesh',
    },
    {
      'imageUrl': 'assets/manali.jpg',
      'tripName': 'Bhopal',
      'location': 'Madhya Pradesh',
    },
    {
      'imageUrl': 'assets/kashmir.jpg',
      'tripName': 'Shillong',
      'location': 'Meghalaya',
    },
  ];

  // Define lists for the Plan Your Next Trip section
  final List<Map<String, String>> nextTrips = [
    {
      'imageUrl': 'assets/bali.jpg',
      'tripName': 'Nagpur',
      'location': 'Maharashtra',
    },
    {
      'imageUrl': 'assets/paris.jpg',
      'tripName': 'Kutch',
      'location': 'Gujarat',
    },
    {
      'imageUrl': 'assets/tokyo.jpg',
      'tripName': 'Udupi',
      'location': 'Karnataka',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Color primaryGreen = Color(0xFF4CAF50);
    final Color lightBackground = Colors.grey[200]!;
    final Color darkTextColor = Colors.black;
    final Color whiteColor = Colors.white;

    return Scaffold(
      backgroundColor: lightBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Greeting and Profile Picture
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Welcome to Agriventure',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/profile.jpg'), // Profile image path
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for beautiful locations',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Popular Trip Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Trip',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: darkTextColor),
                  ),
                  Text(
                    'Explore >',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Horizontal List for Popular Trips
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularTrips.length,
                itemBuilder: (context, index) {
                  String imageUrl = popularTrips[index]['imageUrl']!;
                  String tripName = popularTrips[index]['tripName']!;
                  String location = popularTrips[index]['location']!;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetailsScreen(
                            imageUrl: imageUrl,
                            name: tripName,
                            location: location,
                            description: 'Beautiful hills and tea plantations.',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                            child: Image.asset(
                              imageUrl,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tripName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: darkTextColor,
                                  ),
                                ),
                                Text(
                                  location,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: List.generate(
                                    5,
                                        (starIndex) => Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Plan Your Next Trip Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Plan your next trip!',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: darkTextColor),
              ),
            ),
            SizedBox(height: 10),
            // Vertically Scrollable Postcards
            Container(
              height: 400, // Set height for the scrollable area
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: nextTrips.length,
                itemBuilder: (context, index) {
                  String postcardImageUrl = nextTrips[index]['imageUrl']!;
                  String postcardName = nextTrips[index]['tripName']!;
                  String postcardLocation = nextTrips[index]['location']!;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetailsScreen(
                            imageUrl: postcardImageUrl,
                            name: postcardName,
                            location: postcardLocation,
                            description:
                            'Visit the beautiful beaches and resorts.',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 300, //250  // Adjust height for the rectangular shape
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                            child: Image.asset(
                              postcardImageUrl,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  postcardName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: darkTextColor,
                                  ),
                                ),
                                Text(
                                  postcardLocation,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: List.generate(
                                    5,
                                        (starIndex) => Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:agriventure/wishlist.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF4CAF50), // Match your primary color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              SizedBox(height: 16),

              // Username
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Bio
              Text(
                'Travel enthusiast, foodie, and nature lover. '
                    'Exploring the world one destination at a time!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 24),

              // Divider
              Divider(thickness: 2),

              // Profile Options
              ProfileOptionTile(
                icon: Icons.edit,
                title: 'Edit Profile',
                onTap: () {
                  // Add edit profile logic here
                },
              ),
              ProfileOptionTile(
                icon: Icons.favorite,
                title: 'Saved Trips',
                onTap: () {
                  // Add saved trips logic here
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WishlistScreen()),);
                },
              ),
              ProfileOptionTile(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {
                  // Navigate to settings page
                },
              ),
              ProfileOptionTile(
                icon: Icons.analytics,
                title: 'User Statistics',
                onTap: () {
                  // Show user statistics
                },
              ),
              ProfileOptionTile(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  // Add logout logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for Profile Options
class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const ProfileOptionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF4CAF50)), // Match your primary color
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

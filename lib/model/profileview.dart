import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartprices/model/profile_model.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<ProfileModel> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = fetchProfile();
  }

  Future<ProfileModel> fetchProfile() async {
    final response =
        await http.get(Uri.parse('https://kaproject-cfd93-default-rtdb.firebaseio.com/gadget/profile.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final profileData = data.values.first;
      return ProfileModel.fromJson(profileData);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder<ProfileModel>(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return Center(
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), // Increase the border radius for a more rounded appearance
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0), // Increase the padding for more space
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70, // Increase the radius for a larger avatar
                        backgroundImage: NetworkImage(snapshot.data!.gambar),
                      ),
                      SizedBox(height: 24), // Increase the height between the avatar and text
                      Text(
                        'Nama: ${snapshot.data!.nama}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 25), // Increase the height between text elements
                      Text('Alamat: ${snapshot.data!.alamat}', style: TextStyle(fontSize: 18)),
                      Text('Jenis Kelamin: ${snapshot.data!.kelamin}', style: TextStyle(fontSize: 18)),
                      Text('Nomor Telepon: ${snapshot.data!.notelp}', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          // Handle navigation based on the index (e.g., switch case or navigation to different screens)
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

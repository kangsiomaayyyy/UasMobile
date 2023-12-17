import 'package:flutter/material.dart';
import 'package:smartprices/model/IphoneModel.dart';

class IphoneDetail extends StatelessWidget {
  final IphoneModel iphone;

  IphoneDetail({required this.iphone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(iphone.typeiphone),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgs2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0, // Adjust the height as needed
                child: Center(
                  child: Image.network(
                    iphone.gambar,
                    height: 150.0, // Adjust the image height as needed
                    width: 150.0, // Adjust the image width as needed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0, // Set the elevation for the card
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: ${iphone.typeiphone}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('Harga: \$${iphone.harga}', style: TextStyle(fontSize: 18.0)),
                      SizedBox(height: 8.0),
                      Text('Spesifikasi: ${iphone.spesifikasi}', style: TextStyle(fontSize: 16.0)),
                      SizedBox(height: 8.0),
                      Text('Tanggal Rilis: ${iphone.tglrilis}', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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

import 'package:flutter/material.dart';
import 'package:smartprices/model/macbook_model.dart';

class MacbookDetail extends StatelessWidget {
  final MacbookModel macbook;

  MacbookDetail({required this.macbook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(macbook.typeiphone),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgs2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                child: Center(
                  child: Image.network(
                    macbook.gambar,
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: ${macbook.typeiphone}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('Harga: \$${macbook.harga}', style: TextStyle(fontSize: 18.0)),
                      SizedBox(height: 8.0),
                      Text('Spesifikasi: ${macbook.spesifikasi}', style: TextStyle(fontSize: 16.0)),
                      SizedBox(height: 8.0),
                      Text('Tanggal Rilis: ${macbook.tglrilis}', style: TextStyle(fontSize: 16.0)),
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

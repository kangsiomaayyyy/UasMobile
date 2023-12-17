  import 'package:flutter/material.dart';
import 'package:smartprices/model/homepage.dart';
  import 'package:smartprices/model/login.dart'; // Gantilah dengan nama file homepage.dart yang sesuai dengan proyek Anda

  class OnboardingPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      Color textColor = Color(0xffa5948a); // Warna teks yang sama dengan "WELCOME TO SMARTPRICES"

      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bgs2.jpg'), // Sesuaikan dengan nama file dan path gambar Anda
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Ganti menjadi start
              children: [
                SizedBox(height: 70.0), // Menambahkan jarak dari atas
                Text(
                  'WELCOME\nTO\nSMARTPRICES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 350.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Container(
                    width: 270.0, // Sesuaikan lebar sesuai kebutuhan
                    height: 50.0, // Sesuaikan tinggi sesuai kebutuhan
                    child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          fontSize: 18.0, // Sesuaikan ukuran teks sesuai kebutuhan
                          color: textColor, // Gunakan warna yang sama dengan "WELCOME TO SMARTPRICES"
                          fontWeight: FontWeight.bold, // Tambahkan properti ini untuk membuat teks tebal (BOLD)
                        ),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void main() {
    runApp(MaterialApp(
      home: OnboardingPage(),
    ));
  }

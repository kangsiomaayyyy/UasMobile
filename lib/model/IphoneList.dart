import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartprices/detail/IphoneDetail.dart';
import 'dart:convert';
import 'IphoneModel.dart';

class IphoneList extends StatefulWidget {
  @override
  _IphoneListState createState() => _IphoneListState();
}

class _IphoneListState extends State<IphoneList> {
  late List<IphoneModel> iphoneList;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://kaproject-cfd93-default-rtdb.firebaseio.com/gadget/iphone.json'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<IphoneModel> list = [];

      data.forEach((key, value) {
        list.add(IphoneModel.fromJson(key, value));
      });

      setState(() {
        iphoneList = list;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('IPHONE LIST'),
    ),
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bgs2.jpg'), // Change the path based on your asset location
          fit: BoxFit.cover,
        ),
      ),
      child: iphoneList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: iphoneList.length,
              itemBuilder: (context, index) {
                return Card(
  color: Colors.brown.withOpacity(0.5), // Set the background color with transparency
  elevation: 8,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: ListTile(
    contentPadding: EdgeInsets.all(16),
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        iphoneList[index].gambar,
        width: 45,
        height: 80,
        fit: BoxFit.cover,
      ),
    ),
    title: Text(
      iphoneList[index].typeiphone,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IphoneDetail(iphone: iphoneList[index]),
        ),
      );
    },
  ),
);

              },
            ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
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
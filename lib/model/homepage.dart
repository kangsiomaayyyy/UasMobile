import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartprices/detail/IphoneDetail.dart';
import 'package:smartprices/detail/MacbookDetail.dart';
import 'package:smartprices/model/IphoneModel.dart';
import 'package:smartprices/model/MacBookService.dart';
import 'package:smartprices/model/ProfileView.dart';
import 'package:smartprices/model/macbook_model.dart';
import 'package:smartprices/model/profile_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color textColor = Color(0xffa5948a);

  Widget buildNavigationButton(BuildContext context, IconData icon, String label, String routeName) {
    return GestureDetector(
      onTap: () {
        if (routeName == 'iphone') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IphoneList()), // Replace IphoneList with the actual class
          );
        } else if (routeName == 'laptop') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MacbookList()), // Replace MacbookList with the actual class
          );
        }
      },
      child: Column(
        children: [
          Icon(icon, size: 40.0, color: textColor),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle shopping cart icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Handle message icon press
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgs2.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: Colors.brown.withOpacity(0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) side
                      children: [
                        Text(
                          'WELCOME,\nACHMAD RAKA !!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0), // Add some spacing between the text and the row of buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildNavigationButton(context, Icons.book, 'Catalog', ''),
                            buildNavigationButton(context, Icons.phone_android, 'iPhone', 'iphone'),
                            buildNavigationButton(context, Icons.laptop, 'Laptop', 'laptop'),
                          ],
                        ),
                        SizedBox(height:8.0), // Add some spacing between the row of buttons and the text
                        Text(
                          'Recomendation', // Add the "Recomendation" text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            Positioned(
              top: kToolbarHeight + 100.0,
              left: 16.0,
              right: 16.0,
              bottom: 0.0,
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    List<Map<String, dynamic>> data = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200.0,
                          margin: EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            color: Colors.white.withOpacity(0.7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                                  child: Image.network(
                                    data[index]['gambar'],
                                    height: 200.0,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index]['typeiphone'],
                                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        'Harga: \$${data[index]['harga']}',
                                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        'Tanggal Rilis: ${data[index]['tglrilis']}',
                                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              // Handle navigation for Home
              break;
            case 1:
              // Handle navigation for Cart
              break;
            case 2:
              // Navigate to ProfileView
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              );
              break;
          }
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

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse('https://kaproject-cfd93-default-rtdb.firebaseio.com/gadget/iphone.json'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<Map<String, dynamic>> list = [];

      data.forEach((key, value) {
        list.add({
          'gambar': value['gambar'],
          'typeiphone': value['typeiphone'],
          'harga': value['harga'],
          'tglrilis': value['tglrilis'],
        });
      });

      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// The rest of your code for IphoneList, ProfileView, and MacbookList remains unchanged.


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
  );
}
}

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
        title: Text('Your Profile'),
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
    );
  }
}

class MacbookList extends StatefulWidget {
  @override
  _MacbookListState createState() => _MacbookListState();
}

class _MacbookListState extends State<MacbookList> {
  late Future<List<MacbookModel>> futureMacbooks;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    futureMacbooks = MacbookService().getMacbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Macbooks"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgs2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<MacbookModel>>(
          future: futureMacbooks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.brown.withOpacity(0.5), // Set the background color of the card to brown with transparency
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          snapshot.data![index].gambar,
                          width: 65,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        snapshot.data![index].typeiphone,
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
                            builder: (context) => MacbookDetail(
                              macbook: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

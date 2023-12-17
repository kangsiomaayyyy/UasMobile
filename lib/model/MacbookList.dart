import 'package:flutter/material.dart';
import 'package:smartprices/detail/MacbookDetail.dart';
import 'package:smartprices/model/MacBookService.dart';
import 'package:smartprices/model/macbook_model.dart';

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

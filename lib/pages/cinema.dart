import 'package:cinepolis/component/navbar.dart';
import 'package:flutter/material.dart';

class Cinema extends StatefulWidget {
  @override
  _CinemaState createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> with SingleTickerProviderStateMixin {
  String selectedLocation = "Malang"; // Lokasi yang dipilih

  final List<Map<String, dynamic>> cinemas = [
    {
      "name": "Malang Town Square",
      "distance": "8.03 km away",
      "type": "REGULAR*LUXE",
      "location": "Malang",
    },
    {
      "name": "Lippo Plaza Batu",
      "distance": "11.23 km away",
      "type": "REGULAR",
      "location": "Malang",
    },
    {
      "name": "Batu Paradise Mall",
      "distance": "15.30 km away",
      "type": "REGULAR*LUXE",
      "location": "Malang",
    },
    {
      "name": "Ambarukmo Plaza",
      "distance": "4.05 km away",
      "type": "REGULAR",
      "location": "Yogyakarta",
    },
    {
      "name": "Jogja City Mall",
      "distance": "7.25 km away",
      "type": "REGULAR*LUXE",
      "location": "Yogyakarta",
    },
  ];

  List<Map<String, dynamic>> get filteredCinemas {
    // Filter berdasarkan lokasi yang dipilih
    return cinemas
        .where((cinema) => cinema['location'] == selectedLocation)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            // Dropdown dengan ikon lokasi di margin atas
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black), // Ikon lokasi
                  SizedBox(width: 8.0),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedLocation,
                      underline:
                          SizedBox(), // Menghilangkan garis bawah DropdownButton
                      isExpanded: true,
                      items: ["Malang", "Yogyakarta"].map((String location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(
                            location,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedLocation = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Search bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cinema/Movie",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  // Handle pencarian (opsional)
                },
              ),
            ),
            // TabBar
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: "Movie"),
                Tab(text: "Cinema"),
              ],
            ),
            // Konten TabBar
            Expanded(
              child: TabBarView(
                children: [
                  // Tab Movie
                  Center(
                    child: Text(
                      "Movie content will be here",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Tab Cinema
                  ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: filteredCinemas.length,
                    itemBuilder: (context, index) {
                      var cinema = filteredCinemas[index];
                      return Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10.0),
                          title: Text(
                            cinema['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 18, color: Colors.black),
                                  SizedBox(width: 8.0),
                                  Text(
                                    cinema['distance'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 4.0), // Add some space between rows
                              Row(
                                children: [
                                  Icon(Icons.movie_filter,
                                      size: 18, color: Colors.black),
                                  SizedBox(width: 8.0),
                                  Text(
                                    cinema['type'],
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              // Aksi ketika tombol arrow ditekan
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CinemaDetail(cinema: cinema),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: navbar(),
      ),
    );
  }
}

class CinemaDetail extends StatelessWidget {
  final Map<String, dynamic> cinema;

  CinemaDetail({required this.cinema});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cinema['name']),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              cinema['name'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              "Distance: ${cinema['distance']}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              "Type: ${cinema['type']}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Cinema(),
  ));
}

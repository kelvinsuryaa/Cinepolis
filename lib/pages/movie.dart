import 'package:cinepolis/component/navbar.dart';
import 'package:flutter/material.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> with SingleTickerProviderStateMixin {
  late TabController _tabController; // Tab controller untuk TabBar
  String searchQuery = ''; // Variabel untuk menyimpan query pencarian
  String selectedLocation = 'Malang'; // Lokasi yang dipilih

  final List<Map<String, String>> movies = [
    {
      'title': 'BILA ESOK IBU TIADA',
      'image': 'beit.jpg',
    },
    {
      'title': 'MOANA 2',
      'image': 'm.jpg',
    },
    {
      'title': 'PETAK UMPET',
      'image': 'pu.jpg',
    },
    {
      'title': 'MOANA 2',
      'image': 'm.jpg',
    },
  ];

  final List<Map<String, String>> cinemas = [
    {'name': 'Cinepolis Malang', 'distance': '5 km', 'type': 'IMAX'},
    {'name': 'Cinepolis Yogyakarta', 'distance': '10 km', 'type': '2D'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Inisialisasi TabBar
  }

  @override
  void dispose() {
    _tabController.dispose(); // Membersihkan TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Dropdown button dengan lokasi dan garis pinggir
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedLocation,
                      underline: Container(
                        height: 2,
                        color: Colors
                            .grey.shade300, // Garis pinggir di bawah Dropdown
                      ),
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
                  hintText: "Search Cinema/Movie",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            // TabBar placed below the search box
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Movies"),
                  Tab(text: "Cinemas"),
                ],
              ),
            ),
            // TabBarView untuk Movies dan Cinemas
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab Movies
                  GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      var movie = movies[index];
                      if (searchQuery.isNotEmpty &&
                          !movie['title']!
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase())) {
                        return Container(); // Skip jika tidak cocok dengan query pencarian
                      }
                      return Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            // Image section, fills the available space
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                movie['image']!,
                                width: double.infinity,
                                height:
                                    330, // Height of the image, you can adjust if necessary
                                fit: BoxFit
                                    .cover, // Ensures the image covers the entire box
                              ),
                            ),
                            // Text and Buy Now button section, takes up remaining space
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie['title']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle Book Now button click
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade900,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      minimumSize: const Size.fromHeight(40),
                                    ),
                                    child: const Text(
                                      'Buy Now',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Tab Cinemas
                  ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: cinemas.length,
                    itemBuilder: (context, index) {
                      var cinema = cinemas[index];
                      if (searchQuery.isNotEmpty &&
                          !cinema['name']!
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase())) {
                        return Container(); // Skip jika tidak cocok dengan query pencarian
                      }
                      return Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10.0),
                          title: Text(
                            cinema['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cinema['distance']!),
                              Text(cinema['type']!,
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: navbar(), // Navbar
    );
  }
}

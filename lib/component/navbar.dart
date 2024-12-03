import 'package:cinepolis/pages/booking.dart';
import 'package:cinepolis/pages/movie.dart';
import 'package:flutter/material.dart';
import 'package:cinepolis/pages/homepage.dart';
import 'package:cinepolis/pages/cinema.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  void changeSelectedNavBar(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.book_online_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
          ),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.movie_creation,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Movie()),
              );
            },
          ),
          label: 'Movie',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.theaters,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cinema()),
              );
            },
          ),
          label: 'Cinema',
        ),
      ],
    );
  }
}

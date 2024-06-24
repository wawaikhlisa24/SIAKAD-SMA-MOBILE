import 'package:akademik/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'materi_page.dart'; 
import 'data_page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // index for current selected bottom nav item

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const MateriPage(),
    const DataPage(), // Use the new DataPage
    const Text('Profile Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
            children: [
              Text(
                'Hello👋',
                style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email!.toString(),
                style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded( // Expand to fill the remaining space
                child: Center( // Center the selected widget
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue, // Color for Home icon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Materi',
            backgroundColor: Colors.green, // Color for Materi icon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Data',
            backgroundColor: Colors.orange, // Color for Data icon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'logout',
            backgroundColor: Colors.purple, // Color for Person icon
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 3) { // If "Person" icon is tapped (index 3)
      _logout(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _logout(BuildContext context) async {
    await AuthService().signout(context: context);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to E-leraning Siakad',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCard('All Courses', '04/06', Icons.book),
              InfoCard('All Projects', '40/60', Icons.work),
              InfoCard('Test Passed', '15/20', Icons.check_circle),
            ],
          ),
          SizedBox(height: 22),
          LessonCard(),
          SizedBox(height: 22),
          LearningActivity(),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  InfoCard(this.title, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 80,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(icon, size: 30),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Lesson",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularProgressIndicator(
                  value: 0.8,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.blue,
                  strokeWidth: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Class: Electrical Engg'),
                    Text('Lessons: 5 Lessons'),
                    Text('Time: Lessons'),
                    Text('Assignment: 5 Assignment'),
                    Text('Staff: John Doe'),
                    Text('Lesson Learned: 10/50'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LearningActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Learning Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Implement the learning activity list here.
            Text("Learning activity details go here."),
          ],
        ),
      ),
    );
  }
}

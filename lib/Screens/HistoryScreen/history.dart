import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedBottomIndex = 3;

  final List<Map<String, dynamic>> _movies = [
    {
      'title': 'Black Widow',
      'rating': 7.7,
      'image': 'assets/images/black_widow.png'
    },
    {'title': '', 'rating': 7.7, 'image': 'assets/images/fast_furious.png'},
    {'title': '1917', 'rating': 7.7, 'image': 'assets/images/1917.png'},
    {'title': 'Avengers', 'rating': 7.7, 'image': 'assets/images/avengers.png'},
    {
      'title': 'Godzilla',
      'rating': 7.7,
      'image': 'assets/images/godzilla.png'
    },
    {
      'title': 'Black Panther',
      'rating': 7.7,
      'image': 'assets/images/black_panther.png'
    },
    {
      'title': 'Iron Man3',
      'rating': 7.7,
      'image': 'assets/movies/iron_man3.png'
    },
    {
      'title': 'Doctor Who',
      'rating': 7.7,
      'image': 'assets/images/doctor_who.png'
    },

    {
      'title': 'Wednesday',
      'rating': 7.7,
      'image': 'assets/images/wednesday.png'
    },

  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onBottomItemTapped(int index) {
    setState(() => _selectedBottomIndex = index);

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFFFFB800),
          indicatorWeight: 3,
          labelColor: Color(0xFFFFB800),
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.list, size: 24),
                  SizedBox(height: 4),
                  Text('Watch List', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.folder, size: 24),
                  SizedBox(height: 4),
                  Text('History', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEmptyState(),
          _buildHistoryGrid(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1C1C1C),
          border: Border(top: BorderSide(color: Colors.grey[900]!, width: 1)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFFFB800),
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedBottomIndex,
          onTap: _onBottomItemTapped,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 28),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 28),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, size: 28),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 28),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _movies[index]['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey[900]!, Colors.grey[800]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.movie,
                          size: 40,
                          color: Colors.grey[700],
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${_movies[index]['rating']}',
                          style: TextStyle(
                            color: Color(0xFFFFB800),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFB800),
                          size: 11,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '🎬🍿',
            style: TextStyle(fontSize: 80),
          ),
          SizedBox(height: 16),
          Text(
            'No items in watch list',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

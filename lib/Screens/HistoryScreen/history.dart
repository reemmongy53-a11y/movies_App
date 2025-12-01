import 'package:flutter/material.dart';
import '../../models/movie_model.dart';
import '../ProfileScreen/profile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedTab = 1; // 0 = Watch List, 1 = History
  int _selectedBottomNav = 2; // Index for bottom navigation

  // قائمة الأفلام
  final List<Movie> movies = [
    Movie(title: 'Black Widow', rating: 7.7, imagePath: 'assets/images/black_widow.png'),
    Movie(title: 'Fast & Furious', rating: 7.7, imagePath: 'assets/images/fast_furious.png'),
    Movie(title: 'Titans', rating: 7.7, imagePath: 'assets/images/titans.png'),
    Movie(title: 'Avengers', rating: 7.7, imagePath: 'assets/images/avengers.png'),
    Movie(title: 'Avengers: Endgame', rating: 7.7, imagePath: 'assets/images/endgame.png'),
    Movie(title: 'Black Widow 2', rating: 7.7, imagePath: 'assets/images/black_widow2.png'),
    Movie(title: 'Black Panther', rating: 7.7, imagePath: 'assets/images/black_panther.png'),
    Movie(title: 'Black Widow 3', rating: 7.7, imagePath: 'assets/images/black_widow3.png'),
    Movie(title: 'Doctor Who', rating: 7.7, imagePath: 'assets/images/doctor_who.png'),
    Movie(title: 'Titanic', rating: 7.7, imagePath: 'assets/images/titanic.png'),
    Movie(title: 'Wednesday', rating: 7.7, imagePath: 'assets/images/wednesday.png'),
    Movie(title: 'Movie Title', rating: 7.7, imagePath: 'assets/images/movie.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            // Top Tabs
            _buildTopTabs(),

            // Movies Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return _buildMovieCard(movies[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopTabs() {
    return Container(
      color: const Color(0xFF1A1A1A),
      child: Row(
        children: [
          // Watch List Tab
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedTab == 0 ? const Color(0xFFFFA500) : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.list,
                      color: _selectedTab == 0 ? const Color(0xFFFFA500) : Colors.grey,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Watch List',
                      style: TextStyle(
                        color: _selectedTab == 0 ? const Color(0xFFFFA500) : Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // History Tab
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedTab == 1 ? const Color(0xFFFFA500) : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.history,
                      color: _selectedTab == 1 ? const Color(0xFFFFA500) : Colors.grey,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'History',
                      style: TextStyle(
                        color: _selectedTab == 1 ? const Color(0xFFFFA500) : Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return GestureDetector(
      onTap: () {
        _openMovieDetails(movie);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Movie Poster
              Image.asset(
                movie.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF3A3A3A),
                    child: const Icon(
                      Icons.movie,
                      size: 40,
                      color: Colors.white24,
                    ),
                  );
                },
              ),

              // Rating Badge
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movie.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFD700),
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: const Color(0xFFFFA500),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedBottomNav,
        onTap: (index) {
          setState(() {
            _selectedBottomNav = index;
          });
          _handleBottomNavigation(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _handleBottomNavigation(int index) {
    switch (index) {
      case 0:
      // Navigate to Home
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Home')),
        );
        break;
      case 1:
      // Navigate to Search
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Search')),
        );
        break;
      case 2:
      // Show Add Dialog
        _showAddDialog();
        break;
      case 3:
      // Navigate to Profile
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: const Text(
          'Add New',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Add new content functionality',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _openMovieDetails(Movie movie) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: Text(
          movie.title,
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rating: ${movie.rating}',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            const Text(
              'Movie details will be shown here',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}



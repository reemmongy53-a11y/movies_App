import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedBottomIndex = 3;

  String userName = 'John Safwat';
  String userPhone = '01200000000';
  int userAvatar = 0;

  final List<String> _avatarPaths = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
    'assets/images/avatar9.png',
  ];

  final String popcornImage = 'assets/images/popcorn.png';

  final List<Map<String, dynamic>> _movies = [
    {
      'title': 'Black Widow',
      'rating': 7.7,
      'image': 'assets/images/black_widow.png'
    },
    {
      'title': ' Fast Furious',
      'rating': 7.7,
      'image': 'assets/images/fast_furious.png'
    },
    {'title': 'Titans', 'rating': 7.7, 'image': 'assets/images/titans.png'},
    {'title': 'Avengers', 'rating': 7.7, 'image': 'assets/images/avengers.png'},
    {
      'title': 'Avengers Endgame',
      'rating': 7.7,
      'image': 'assets/images/endgame.png'
    },
    {
      'title': '1917',
      'rating': 7.7,
      'image': 'assets/images/1917.png'
    },
    {
      'title': 'Black Panther',
      'rating': 7.7,
      'image': 'assets/images/black_panther.png'
    },
    {
      'title': 'wednesday',
      'rating': 7.7,
      'image': 'assets/images/wednesday.png'
    },
    {
      'title': 'Doctor Who',
      'rating': 7.7,
      'image': 'assets/images/doctor_who.png'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        setState(() {
          userName = args['name'] ?? userName;
          userPhone = args['phone'] ?? userPhone;
          userAvatar = args['avatar'] ?? userAvatar;
        });
      }
    });
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        _avatarPaths[userAvatar],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            _buildStat('12', 'Wish List'),
                            SizedBox(width: 32),
                            _buildStat('10', 'History'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          '/editProfile',
                          arguments: {
                            'name': userName,
                            'phone': userPhone,
                            'avatar': userAvatar,
                          },
                        );

                        if (result != null && result is Map) {
                          setState(() {
                            userName = result['name'] ?? userName;
                            userPhone = result['phone'] ?? userPhone;
                            userAvatar = result['avatar'] ?? userAvatar;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFB800),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Exit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.exit_to_app, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            TabBar(
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildWatchListTab(),
                  _buildHistoryTab(),
                ],
              ),
            ),
          ],
        ),
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
                icon: Icon(Icons.home, size: 28), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 28), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore, size: 28), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 28), label: ''),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildWatchListTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            popcornImage,
            width: 150,
            height: 150,
            errorBuilder: (context, error, stackTrace) {
              return Text('🎬🍿', style: TextStyle(fontSize: 80));
            },
          ),
          SizedBox(height: 16),
          Text(
            'No items yet',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
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
                        child: Icon(Icons.movie,
                            size: 40, color: Colors.grey[700]),
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
}

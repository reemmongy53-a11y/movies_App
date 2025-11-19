import 'package:flutter/material.dart';
import '../core/AppTheme/Theme.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isEgyptianLanguage = true;

  int _selectedAvatar = 0;

  final List<String> _avatarPaths = const [
    'assets/images/avatar.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
  ];

  Widget _buildAvatar({
    required String path,
    required int index,
    required double size,
  }) {
    final bool isSelected = (_selectedAvatar == index);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvatar = index;
        });
      },
      child: Container(
        width: size,
        height: size,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          color: isSelected ? primaryYellow.withOpacity(0.2) : inputFieldColor,
          border: isSelected
              ? Border.all(color: primaryYellow, width: 4)
              : Border.all(color: Colors.transparent, width: 4),
        ),
        child: Center(
          child: Image.asset(
            path,
            width: size * 0.5,
            height: size * 0.5,

            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.person, size: size * 0.5, color: primaryYellow);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageToggle() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text('🇪🇬', style: TextStyle(fontSize: 30)),
            Switch(
              value: _isEgyptianLanguage,
              onChanged: (bool value) {
                setState(() {
                  _isEgyptianLanguage = value;
                });
              },
              activeColor: primaryYellow,
              inactiveThumbColor: primaryYellow,
              inactiveTrackColor: inputFieldColor,
              activeTrackColor: inputFieldColor,
            ),

            const Text('🇺🇸', style: TextStyle(fontSize: 30)),
          ],
        ),

        const SizedBox(height: 5),
        Text(
          _isEgyptianLanguage ? 'اللغة: العربية (مفعلة)' : 'Language: English (Active)',
          style: TextStyle(color: _isEgyptianLanguage ? primaryYellow : Colors.white54, fontSize: 14),
        ),
      ],
    );
  }


  Widget _buildSelectedAvatarDisplay() {

    final String selectedPath = _avatarPaths[_selectedAvatar];

    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.only(bottom: 30.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: inputFieldColor,
        border: Border.all(color: primaryYellow, width: 4),
      ),
      child: Center(

        child: Image.asset(
          selectedPath,
          width: 70,
          height: 70,

          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.person,
              size: 70,
              color: primaryYellow,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Register', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[

            _buildSelectedAvatarDisplay(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAvatar(
                  path: _avatarPaths[0],
                  index: 0,
                  size: 70.0,
                ),
                _buildAvatar(
                  path: _avatarPaths[1],
                  index: 1,
                  size: 70.0,
                ),
                _buildAvatar(
                  path: _avatarPaths[2],
                  index: 2,
                  size: 70.0,
                ),
              ],
            ),
            const Text('Choose Avatar', style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 30.0),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
                prefixIcon: Icon(Icons.person, color: primaryYellow),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20.0),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email, color: primaryYellow),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20.0),

            TextFormField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock, color: primaryYellow),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20.0),

            TextFormField(
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock, color: primaryYellow),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20.0),

            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                prefixIcon: Icon(Icons.phone, color: primaryYellow),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30.0),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Create Account'),
            ),
            const SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Already Have Account ? ", style: TextStyle(color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: primaryYellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),

            _buildLanguageToggle(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
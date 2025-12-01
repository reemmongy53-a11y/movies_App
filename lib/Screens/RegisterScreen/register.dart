import 'package:flutter/material.dart';
import '../ProfileScreen/profile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _selectedAvatar = 1;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isArabic = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  final List<String> _avatarPaths = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
  ];

  Widget _buildAvatarOption(int index) {
    bool isSelected = _selectedAvatar == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvatar = index;
        });
      },
      child: Container(
        width: isSelected ? 100 : 70,
        height: isSelected ? 100 : 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFFF5C518) : Colors.transparent,
            width: 3,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            _avatarPaths[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String hint, bool obscure, VoidCallback onToggle, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.white70),
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.white70,
            ),
            onPressed: onToggle,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF5C518)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Register',
          style: TextStyle(color: Color(0xFFF5C518)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAvatarOption(0),
                  _buildAvatarOption(1),
                  _buildAvatarOption(2),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Avatar', style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 32),

              _buildTextField(Icons.person_outline, 'Name', _nameController),
              const SizedBox(height: 16),

              _buildTextField(Icons.email_outlined, 'Email', _emailController),
              const SizedBox(height: 16),

              _buildPasswordField('Password', _obscurePassword, () {
                setState(() => _obscurePassword = !_obscurePassword);
              }, _passwordController),
              const SizedBox(height: 16),

              _buildPasswordField('Confirm Password', _obscureConfirmPassword, () {
                setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
              }, _confirmPasswordController),
              const SizedBox(height: 16),

              _buildTextField(Icons.phone_outlined, 'Phone Number', _phoneController),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5C518),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already Have Account ? ',
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFF5C518),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              GestureDetector(
                onTap: () {
                  setState(() {
                    _isArabic = !_isArabic;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: !_isArabic ? const Color(0xFFF5C518) : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/usa.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: _isArabic ? const Color(0xFFF5C518) : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/egypt.png',
                          width: 24,
                          height: 24,
                        ),
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
}
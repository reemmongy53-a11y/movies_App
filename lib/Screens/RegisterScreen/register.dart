import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Screens/LoginScreen/globals.dart';
import 'package:movies_app/Screens/ProfileScreen/Profile.dart';
import '../ProfileScreen/profile.dart' hide ProfileScreen;
import '../user_database.dart';

class RegisterScreen extends StatefulWidget {
  final bool isArabic;

  const RegisterScreen({Key? key, this.isArabic = false}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  late bool _isArabic;
  int _selectedAvatar = 1;

  final List<String> avatarPaths = [
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

  final List<String> avatarEmojis = [
    '👨🏻‍💼',
    '👨🏻',
    '👨🏻‍🦰',
    '👨🏻‍🦱',
    '👩🏻‍🦰',
    '👨🏻‍🦳',
    '👩🏻',
    '👨🏻‍🦲',
    '🧔🏻'
  ];

  @override
  void initState() {
    super.initState();
    _isArabic = widget.isArabic;
  }

  void _register() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    String phone = _phoneController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isArabic
              ? 'من فضلك املأ جميع الحقول'
              : 'Please fill all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isArabic
              ? 'من فضلك أدخل بريد إلكتروني صحيح'
              : 'Please enter a valid email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isArabic
              ? 'كلمة المرور يجب أن تكون 6 أحرف على الأقل'
              : 'Password must be at least 6 characters'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isArabic
              ? 'كلمات المرور غير متطابقة'
              : 'Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!RegExp(r'^[0-9]{10,}$').hasMatch(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isArabic
              ? 'من فضلك أدخل رقم هاتف صحيح'
              : 'Please enter a valid phone number'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    bool emailExists = UserDatabase.users.any((user) => user['email'] == email);
    if (emailExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isArabic
              ? 'البريد الإلكتروني مستخدم بالفعل'
              : 'Email already exists'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Map<String, dynamic> newUser = {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'avatar': _selectedAvatar,
      'wishlist': 12,
      'history': 10,
    };

    UserDatabase.users.add(newUser);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isArabic
            ? 'تم إنشاء الحساب بنجاح!'
            : 'Account created successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(userData: userData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      _isArabic ? 'التسجيل' : 'Register',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFFFBF00),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAvatarOption(_selectedAvatar == 0
                          ? 0
                          : (_selectedAvatar - 1) % avatarEmojis.length),
                      const SizedBox(width: 15),
                      _buildAvatarOption(_selectedAvatar, isCenter: true),
                      const SizedBox(width: 15),
                      _buildAvatarOption(
                          (_selectedAvatar + 1) % avatarEmojis.length),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isArabic ? 'الصورة الشخصية' : 'Avatar',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  textDirection:
                      _isArabic ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: _isArabic ? 'الاسم' : 'Name',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  textDirection:
                      _isArabic ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: _isArabic ? 'البريد الإلكتروني' : 'Email',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: _obscurePassword,
                  textDirection:
                      _isArabic ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: _isArabic ? 'كلمة المرور' : 'Password',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: _obscureConfirmPassword,
                  textDirection:
                      _isArabic ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText:
                        _isArabic ? 'تأكيد كلمة المرور' : 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _phoneController,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  textDirection:
                      _isArabic ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: _isArabic ? 'رقم الهاتف' : 'Phone Number',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFBF00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _isArabic ? 'إنشاء حساب' : 'Create Account',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isArabic
                        ? 'لديك حساب بالفعل؟ '
                        : 'Already Have Account ? ',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      _isArabic ? 'تسجيل الدخول' : 'Login',
                      style: const TextStyle(
                        color: Color(0xFFFFBF00),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isArabic = !_isArabic;
                  });
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D2D2D),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 300),
                        alignment: _isArabic
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFBF00),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                _isArabic
                                    ? 'assets/images/egypt_flag.png'
                                    : 'assets/images/usa_flag.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(
                                    _isArabic ? '🇪🇬' : '🇺🇸',
                                    style: const TextStyle(fontSize: 24),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/usa_flag.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(
                                      '🇺🇸',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: !_isArabic
                                            ? Colors.transparent
                                            : Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/egypt_flag.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(
                                      '🇪🇬',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: _isArabic
                                            ? Colors.transparent
                                            : Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarOption(int index, {bool isCenter = false}) {
    bool isSelected = _selectedAvatar == index;
    double size = isCenter ? 100 : 70;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvatar = index;
        });
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF89CFF0),
          border: Border.all(
            color: isSelected ? const Color(0xFFFFBF00) : Colors.transparent,
            width: 3,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            avatarPaths[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Text(
                  avatarEmojis[index],
                  style: TextStyle(fontSize: isCenter ? 50 : 35),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../customWidget/custom_text_field.dart';
import '../customWidget/language_switch.dart';
import '../services/app_service.dart';
import 'Login_Screen/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<String> avatars = [
    'assets/images/avatar.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
  ];

  String? _selectedAvatar;

  @override
  Widget build(BuildContext context) {
    final appService = Provider.of<AppService>(context);
    final isArabic = appService.isArabic;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFFFFBB3B)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'register'.tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFBB3B),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 30),

                Column(
                  children: [
                    Text(
                      'choose_avatar'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    if (_selectedAvatar != null)
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFFFBB3B),
                                    width: 3,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    _selectedAvatar!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: isArabic ? null : 0,
                                left: isArabic ? 0 : null,
                                child: GestureDetector(
                                  onTap: _removeAvatar,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'selected_avatar'.tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: avatars.map((avatar) {
                        return GestureDetector(
                          onTap: () => _selectAvatar(avatar),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selectedAvatar == avatar
                                    ? const Color(0xFFFFBB3B)
                                    : Colors.grey[700]!,
                                width: _selectedAvatar == avatar ? 3 : 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                avatar,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),


                const SizedBox(height: 30),

                CustomTextField(
                  controller: _nameController,
                  hintText: 'name'.tr(),
                  prefixIcon: Icons.person,
                  isRTL: isArabic,
                  backgroundColor: const Color(0xff121312),
                  textColor: Colors.white,
                  cursorColor: Colors.white,
                  hintColor: Colors.grey[500]!,
                  iconColor: Colors.grey[500]!,
                ),

                const SizedBox(height: 15),


                CustomTextField(
                  controller: _emailController,
                  hintText: 'email'.tr(),
                  prefixIcon: Icons.email,
                  isRTL: isArabic,
                  keyboardType: TextInputType.emailAddress,
                  backgroundColor: const Color(0xff121312),
                  textColor: Colors.white,
                  cursorColor: Colors.white,
                  hintColor: Colors.grey[500]!,
                  iconColor: Colors.grey[500]!,
                ),

                const SizedBox(height: 15),


                CustomTextField(
                  controller: _passwordController,
                  hintText: 'password'.tr(),
                  prefixIcon: Icons.lock,
                  isRTL: isArabic,
                  isPassword: true,
                  backgroundColor: const Color(0xff121312),
                  textColor: Colors.white,
                  cursorColor: Colors.white,
                  hintColor: Colors.grey[500]!,
                  iconColor: Colors.grey[500]!,
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'password_required'.tr();
                    }
                    if (value.length < 6){
                      return 'password_min_length'.tr();
                    }
                    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value)) {
                      return 'password_strength'.tr();
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'confirm password'.tr(),
                  prefixIcon: Icons.lock,
                  isRTL: isArabic,
                  isPassword: true,
                  backgroundColor: const Color(0xff121312),
                  textColor: Colors.white,
                  cursorColor: Colors.white,
                  hintColor: Colors.grey[500]!,
                  iconColor: Colors.grey[500]!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'confirm_password_required'.tr();
                    }
                    if (value != _passwordController.text) {
                      return 'passwords_not_match'.tr();
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),


                CustomTextField(
                  controller: _phoneController,
                  hintText: 'phone number'.tr(),
                  prefixIcon: Icons.phone,
                  isRTL: isArabic,
                  keyboardType: TextInputType.phone,
                  backgroundColor: const Color(0xff121312),
                  textColor: Colors.white,
                  cursorColor: Colors.white,
                  hintColor: Colors.grey[500]!,
                  iconColor: Colors.grey[500]!,
                ),

                const SizedBox(height: 30),


                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFBB3B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Create Account'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(text: '${'Already Have Account ?'.tr()} '),
                        TextSpan(
                          text: 'Login'.tr(),
                          style: const TextStyle(
                            color: Color(0xFFFFBB3B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'switch_language'.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const LanguageSwitch(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectAvatar(String avatar) {
    setState(() {
      _selectedAvatar = avatar;
    });
  }

  void _removeAvatar() {
    setState(() {
      _selectedAvatar = null;
    });
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (_selectedAvatar == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('select_avatar_required'.tr())),
        );
        return;
      }


      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('passwords_not_match'.tr())),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('creating_account'.tr())),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../../customWidget/custom_text_field.dart';
import '../../customWidget/language_switch.dart';
import '../../services/app_service.dart';
import '../register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appService = Provider.of<AppService>(context);
    final isArabic = appService.isArabic;

    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    Text(
                      'login'.tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFBB3B),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 50),


                CustomTextField(
                  controller: _emailController,
                  hintText: 'email'.tr(),
                  prefixIcon: Icons.email,
                  isRTL: isArabic,
                  keyboardType: TextInputType.emailAddress,
                  backgroundColor: const Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  cursorColor: Colors.white,
                  hintColor: Colors.grey[500]!,
                ),

                const SizedBox(height: 15),


                CustomTextField(
                  controller: _passwordController,
                  hintText: 'password'.tr(),
                  prefixIcon: Icons.lock,
                  isRTL: isArabic,
                  isPassword: true,
                  backgroundColor: const Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  cursorColor: Colors.white,
                  hintColor: Colors.grey[500]!,
                ),

                const SizedBox(height: 10),


                Align(
                  alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      'forget_password'.tr(),
                      style: const TextStyle(
                        color: Color(0xFFFFBB3B),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),


                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFBB3B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'login'.tr(),
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
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(text: '${'Dont Have Account ?'.tr()} '),
                        TextSpan(
                          text: 'Create One'.tr(),
                          style: const TextStyle(
                            color: Color(0xFFFFBB3B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),


                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[600],
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'OR'.tr(),
                        style: const TextStyle(
                          color: Color(0xFFFFBB3B),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[600],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),


                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {

                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(color: Color(0xFFFFBB3B)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google_logo.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'login_with_google'.tr(),
                          style: const TextStyle(
                            color: Color(0xFFFFBB3B),
                            fontSize: 16,
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

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('logging_in'.tr())),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}



import 'package:flutter/material.dart';
import '../../core/AppTheme/Theme.dart';
import '../register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _isEgyptianLanguage = true;

  Widget _buildLanguageToggle() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              '🇪🇬',
              style: TextStyle(fontSize: 30),
            ),

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

            const Text(
              '🇺🇸',
              style: TextStyle(fontSize: 30),
            ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              margin: const EdgeInsets.only(bottom: 50.0),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryYellow.withOpacity(0.3), width: 2),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,

                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.play_arrow,
                      color: primaryYellow,
                      size: 80,
                    );
                  },
                ),
              ),
            ),

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
            const SizedBox(height: 10.0),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            const SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Don't Have Account ? ", style: TextStyle(color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'Create One',
                    style: TextStyle(
                      color: primaryYellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            const Text(
              'OR',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            const SizedBox(height: 20.0),

            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: inputFieldColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.transparent),
                ),
              ),
              icon: const Padding(
                padding: EdgeInsets.only(right: 8.0),

                child: Icon(Icons.g_mobiledata_rounded, size: 30, color: Colors.white),
              ),
              label: const Text(
                'Login With Google',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40.0),

            _buildLanguageToggle(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginpage_ui/screens/login_screen.dart';
import 'home_page.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(_nameController, 'Name'),
            _buildTextField(_surnameController, 'Surname'),
            _buildTextField(_phoneController, 'Phone Number'),
            _buildTextField(_emailController, 'Email'),
            _buildTextField(_passwordController, 'Password', isPassword: true),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _handleSignUp(context);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(labelText: label),
    );
  }

  Future<void> _handleSignUp(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt başarılı! Şimdi giriş yapın.')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ); // Kayıttan sonra Login ekranına yönlendirme
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata: ${e.message}')),
      );
    }
  }
}

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isPasswordVisibile = false;
  bool _isConfirmPasswordVisibile = false;  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            TextFormField(
              controller: _fullNameController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: "Fullname",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if(value == null || value.trim().isEmpty) {
                  return "Please Enter your Full name";
                }else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if(value == null) {
                  return "Please Enter a valid email";
                }else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _isPasswordVisibile = ! _isConfirmPasswordVisibile;
                  });
                }, icon: Icon(
                  _isPasswordVisibile ? Icons.visibility : Icons.visibility_off
                ),
                ),
              ),
              obscureText: !_isPasswordVisibile ,
            ),
            const SizedBox(height: 16),
            TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisibile = !_isPasswordVisibile;
                  });
                },
                icon: Icon(
                  _isPasswordVisibile
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
            ),
            obscureText: !_isPasswordVisibile,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please Enter Your Full Name';
              }


              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
            ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}

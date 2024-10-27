import 'package:flutter/material.dart';

class UploadCertificatePage extends StatefulWidget {
  @override
  _UploadCertificatePageState createState() => _UploadCertificatePageState();
}

class _UploadCertificatePageState extends State<UploadCertificatePage> {
  String universityRegNo = '';
  String certificatePath = '';
  String contentId = '';
  bool isLoggedIn = false;

  // TextEditingControllers for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      // Debugging message to track login inputs
      print('Logging in with email: ${emailController.text} and password: ${passwordController.text}');

      if (emailController.text == 'admin@example.com' && passwordController.text == 'password') {
        if (mounted) {
          setState(() {
            isLoggedIn = true;

            // Clear email and password fields after successful login
            emailController.clear();
            passwordController.clear();
          });
        }
      } else {
        print('Invalid credentials');
      }
    } catch (e) {
      print('Error during login: $e'); // Catch and log any errors during login
    }
  }

  Future<void> uploadCertificate() async {
    try {
      setState(() {
        contentId = 'QmbEUCgxE1LaoCzwL3GVGSQ3BmF66xi5cmmFZoTfkU8Un1'; // Simulate content ID generation
      });
    } catch (e) {
      print('Error during certificate upload: $e'); // Catch and log any errors during upload
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Certificate'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: isLoggedIn
            ? SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'University Registration Number',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    universityRegNo = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Certificate Path/URL',
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    certificatePath = value;
                  });
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: uploadCertificate,
                  child: Text('Submit'),
                ),
              ),
              if (contentId.isNotEmpty) Text('Content ID: $contentId'),
            ],
          ),
        )
            : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: emailController, // Used controller for better management
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController, // Used controller for better management
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    // Try to login and log any potential issues
                    login().catchError((error) {
                      print('Login failed: $error');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

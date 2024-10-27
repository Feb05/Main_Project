import 'package:flutter/material.dart';

class DownloadCertificatePage extends StatefulWidget {
  @override
  _DownloadCertificatePageState createState() => _DownloadCertificatePageState();
}

class _DownloadCertificatePageState extends State<DownloadCertificatePage> {
  String universityRegNo = '';
  String contentId = '';
  String verificationMessage = ''; // Message to display after verification

  // TextEditingControllers for university registration number and content ID
  final TextEditingController universityRegNoController = TextEditingController();
  final TextEditingController contentIdController = TextEditingController();

  Future<void> downloadCertificate() async {
    // Check if the content ID is correct
    if (contentIdController.text == 'QmbEUCgxE1LaoCzwL3GVGSQ3BmF66xi5cmmFZoTfkU8Un1') {
      setState(() {
        verificationMessage = 'Certificate Verified'; // Set verification success message
      });
    } else {
      setState(() {
        verificationMessage = 'Verification Failed'; // Set verification failed message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Certificate'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: universityRegNoController,
                decoration: InputDecoration(
                  labelText: 'University Registration Number',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  universityRegNo = value; // Update university registration number
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: contentIdController,
                decoration: InputDecoration(
                  labelText: 'Content ID',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  contentId = value; // Update content ID
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    downloadCertificate(); // Directly call the download function
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Download and Verify'),
                ),
              ),
              SizedBox(height: 20),
              if (verificationMessage.isNotEmpty) // Show the verification message
                Text(
                  verificationMessage,
                  style: TextStyle(
                    fontSize: 24, // Change text size
                    color: verificationMessage == 'Certificate Verified' ? Colors.green : Colors.red, // Color based on verification status
                  ),
                ),
              if (verificationMessage == 'Certificate Verified') // Show only if verified
                Column(
                  children: [
                    Text(
                      'Download Certificate',
                      style: TextStyle(
                        fontSize: 24, // Change text size
                        color: Colors.black, // Change text color
                        decoration: TextDecoration.underline, // Underline the text
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_1/Pages/dashboard.dart';

void main()
{
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center( // Center the title text
            child: Text(
              "Unified Certificate Verification System",
            ),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Dash(),
      ),
    );
  }
}

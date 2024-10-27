import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_1/Pages/Upload.dart';
import 'package:major_1/Pages/Download.dart';

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://static.thenounproject.com/png/389196-200.png"),
            backgroundColor: Colors.lightBlueAccent,
          ),
          SizedBox(height: 40,),
          SizedBox(
            height: 80,
            width: 400,
            child: ElevatedButton(onPressed:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>UploadCertificatePage()));},
                style:ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 20)
            ),child: Text("Upload Certificate"),),),
          SizedBox(height: 40,),
          SizedBox(
              height: 80,
              width: 400,
              child: ElevatedButton(onPressed:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>DownloadCertificatePage()));
              }, style:ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 20)
              ),child: Text("Download and Verify Certificate"))),
        ],

      ),
    );
  }
}


import 'package:contact_app/feature/contact_page/presentation/contact_page.dart';
import 'package:contact_app/feature/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyContact());

}

//stateless widget => widgets that are not change

class MyContact extends StatelessWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // we only have one material app in our project
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true
        
      ),
      //we will call our starting page
      home:ContactPage(),
    );
  }
}

// Stateful widget=>widget that are change


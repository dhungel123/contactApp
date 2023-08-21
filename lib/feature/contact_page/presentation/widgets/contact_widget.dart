
import 'package:contact_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key,
    required this.frnName,
    required this.frnContact,
    required this.frnFacebookLink,
    required this.images
  }) : super(key: key);
  final String frnName;
  final String frnContact;
  final String frnFacebookLink;
  final String images;

  //get index => images.length;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage(images)
              ),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(frnName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
                    Text(frnContact,style: TextStyle(fontSize: 16),)

                  ]

              ),
              // GestureDetector(
              //   onTap: (){
              //     print('Icon is clicked');
              //   },
              //     child: Icon(
              //       Icons.phone,
              //       size: 40,
              //     )
              // ),
              InkWell(

                  onTap: (){
                    String phoneNumber=frnContact;
                    callingMethod(phoneNumber);
                    // print('Phone Icon is clicked');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                      size: 24,
                      color: Colors.green,
                    ),
                  )
              ),

              InkWell(
                onTap: (){
                  String website=frnFacebookLink;
                  callingMethod2(website);
                  print('Facebook Icon is clicked');

                },
                child: Icon(
                  Icons.facebook,
                  color: Colors.blue,
                  size: 24,

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  Future<void> callingMethod(String phoneNumber) async {
    final url = 'tel:$phoneNumber';

    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  Future<void> callingMethod2(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

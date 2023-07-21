import 'package:contact_app/core/constants/app_images.dart';
import 'package:contact_app/core/constants/app_strings.dart';
import 'package:contact_app/feature/contact_page/presentation/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

/*
* -Write one class in one page
* -Max line 150-200
* */

class ContactPage extends StatelessWidget {

   ContactPage({Key? key}) : super(key: key);



  //AppStrings appStrings=AppStrings();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title:  Text(AppStrings.myContacts,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ) ,
      body:ListView.builder(
        itemCount: AppStrings.frnName.length,
          itemBuilder:(context,int index){

          return ContactWidget(
              images:AppImages.images[index],
              frnName: AppStrings.frnName[index],
              frnContact: AppStrings.frnContact[index],
              frnFacebookLink: AppStrings.frnFacebookLink[index]);
          }
          ),

      
    );
  }

}

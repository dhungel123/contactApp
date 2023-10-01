import 'package:contact_app/core/constants/app_images.dart';
import 'package:contact_app/core/constants/app_strings.dart';
import 'package:contact_app/feature/contact_page/presentation/widgets/Add_contact.dart';
import 'package:contact_app/feature/contact_page/presentation/widgets/contact_search.dart';
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
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen
        ),
          onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddContacts()));


      }, child: Text('Add Contact', style: TextStyle(color: Colors.white),)),
      appBar:AppBar(
        leading: IconButton(onPressed: (){
          showSearch(context: context, delegate: ContactSearch(
              names:  AppStrings.frnName,
              contacts: AppStrings.frnContact
          ));
        }, icon: Icon(Icons.search,color: Colors.white,size: 32,)),
        actions: [

          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,size: 32,))
          
        ],
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

import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import 'contact_widget.dart';

class ContactSearch extends SearchDelegate<String>{
  List<String> names;
  List<String> contacts;

  ContactSearch({required this.names,required this.contacts});

  @override
  List<Widget>? buildActions(BuildContext context) {
  return [
    IconButton(onPressed: (){
      query='';
    }, icon: const Icon(Icons.clear),
    )

  ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
      return IconButton(onPressed: (){
        close(context,'');
      }, icon: Icon(Icons.arrow_back),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return showSearchResult();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return showSearchResult();
  }
  Widget showSearchResult(){
    List<String> searchNameList = query.isEmpty ? [] : names.where((friendName) => friendName.toLowerCase().contains(query.toLowerCase())).toList();
   // List<String> searchNumberList=query.isEmpty? []: names.where((friendNumber) => friendNumber.toLowerCase().contains(query.toLowerCase())).toList();



    return ListView.builder(
        itemCount: searchNameList.length,
        itemBuilder:(context,int index){
          String frnName= searchNameList[index];
          String contactNo=contacts[names.indexOf(frnName)];

          return searchNameList.isEmpty
              ? const Center(child: Text('No Result Found', style: TextStyle(color: Colors.red) ,),)
              : ContactWidget(
            frnName: frnName,
            frnContact: contactNo,
            frnFacebookLink: '',
            images: '',


          );


        }
    );



  }

}
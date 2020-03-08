import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'studentdetails.dart';

class ListPage extends StatefulWidget {

  final DocumentSnapshot crud;  

  ListPage({this.crud});
  
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  final db = Firestore.instance;
  

  String docID;
  

  Future<void> getPosts()async{
     var firestore = Firestore.instance;
     firestore.collection("CRUD").snapshots();

     QuerySnapshot qn = await firestore.collection("CRUD").getDocuments();
     return qn.documents; 
  }

  navigateToDetail(DocumentSnapshot crud){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(crud: crud,)));
  }

 
 

@override
Widget build(BuildContext context) {
  
  return Scaffold(
    appBar:AppBar(
      title: Text('student list'),
    ),
      body: StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('CRUD').snapshots(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(snapshot.hasError)
        return new Text('Error:${snapshot.error}');
        switch(snapshot.connectionState){
          case ConnectionState.waiting:return new Text('Loading...');
          default:
          return new ListView(
            children:snapshot.data.documents.map((DocumentSnapshot document){
              return new ListTile(
                   title: new Text(document['student name']),
                   onTap: () => navigateToDetail(document),
                   trailing: IconButton(icon: Icon(Icons.delete),
                    onPressed: (){
                    Firestore.instance.collection('CRUD').getDocuments()
                    .then((querySnapshot) {
                    querySnapshot.documents.forEach((docID) {
                    if(docID.data["student id"] == document["student id"]){
                    docID.reference.delete() ;}
        });   
      });
           
                    },
                    ),
                );   
            }).toList(),
              );
            
            } 
      }),
  );
}
}   
      
  

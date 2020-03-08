import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'studentdetails.dart';


class ListPage extends StatefulWidget {
  
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  final db = Firestore.instance;
  DocumentSnapshot document;
  

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
                    onPressed: (){},
                    ),
                );   
            }).toList(),
              );
            
            } 
      }),
  );
      }
    
      }   
      
  
  /*Scaffold(
    appBar: AppBar(
      title: Text('Student List'),
      centerTitle: true,
    ),
    body: projectWidget(),
  );
}

Widget projectWidget() {
  return FutureBuilder(
    future: getPosts(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.none &&
          snapshot.hasData == null) {
       return CircularProgressIndicator();

      }
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
                ListTile(
                 title: Text(snapshot.data[index].data["student name"]),
                 onTap: () => navigateToDetail(snapshot.data[index]),
                 selected: true,
              ),      
            ],
          );
        },
      );
    },
   
  );*/



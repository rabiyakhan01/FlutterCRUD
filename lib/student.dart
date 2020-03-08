import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'studentList.dart';

class Student extends StatefulWidget {
 

  @override
  _StudentState createState() => _StudentState();
}


class _StudentState extends State<Student> {

  
  final  db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String stid;
  String stname;
  String grade;
  String address;
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('CRUD operations'),
        centerTitle: true,
      ),
      body: Form(
              key: _formKey,
              child: ListView(
          padding:EdgeInsets.all(8),
          children:<Widget>[
            TextFormField(
                 decoration: InputDecoration(
                  labelText: 'Student Id'
                 ),
                 
                 validator: (value){
                 if(value.isEmpty){
                 return 'Please Enter Id here';
                }
                
              },
                onSaved: (value) => stid = value, 
                ),
                TextFormField(
                 decoration: InputDecoration(
                  labelText: 'Student name'
                 ),
                 validator: (value){
                 if(value.isEmpty){
                 return 'Please Enter name here';
                }
              },
                onSaved: (value) => stname = value, 
                ),
                TextFormField(
                 decoration: InputDecoration(
                  labelText: 'Student grade'
                 ),
                 validator: (value){
                 if(value.isEmpty){
                 return 'Please Enter Grade here';
                }
              },
                onSaved: (value) => grade = value, 
                ),
                TextFormField(
                 decoration: InputDecoration(
                  labelText: 'Student Address'
                 ),
                 validator: (value){
                 if(value.isEmpty){
                 return 'Please Enter Address here';
                }
              },
                onSaved: (value) => address = value, 
                ),
                RaisedButton(onPressed:createData,
                child: Text('Add',
                ),
                ),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPage()));
                },
                child: Text('Student List',
                ),
                ),
          ],
        ),
      ),
    );
    
  } 
  void createData() async{
    if (_formKey.currentState.validate()){
      _formKey.currentState.save(); 
      DocumentReference ref =await db.collection('CRUD').add({'student id':'$stid','student name':'$stname','student grade':'$grade','student address':'$address'});
      setState(() =>  stid =ref.documentID);
      print(ref..documentID);
    }
  }

}



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DetailPage extends StatefulWidget {

  final DocumentSnapshot crud;  

  DetailPage({this.crud});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameController=new TextEditingController();
  TextEditingController gradeController=new TextEditingController();
  TextEditingController addressController=new TextEditingController();
  DocumentSnapshot crud;
  DocumentSnapshot doc;
  final db = Firestore.instance;
          @override
          Widget build(BuildContext context) {
            return Scaffold(
                 appBar: AppBar(
                   title:Text('Student Details'),
                   centerTitle: true,
                  actions: <Widget>[
                    Padding(padding: EdgeInsets.only(right:20.0),
                    child: GestureDetector(
                      onTap:(){},
                      child:IconButton(icon: Icon(Icons.edit,
                      size: 26.0,
                      ), 
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>UpdateData(crud:crud ,) )).then((value){
                        setState(() {
                          doc=widget.crud;
                          nameController.text = widget.crud.data['student name'];
                          gradeController.text = widget.crud.data['student grade'];
                          addressController.text = widget.crud.data['student address'];         
                        });  
                        });
                      }
                    
                      ),
                      
                    ),
                    )
                  ],
                 ),
                 body: Container(
                child: Card(
                  child: ListView(
                  children: <Widget>[
                  
                    ListTile(
                      leading: Icon(Icons.supervised_user_circle),
                      title: Text(widget.crud.data["student name"]),
                      selected: true,
                      ),
                    ListTile(
                      leading: Icon(Icons.grade),
                      title: Text(widget.crud.data["student grade"]),
                      selected: true,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text(widget.crud.data["student address"]),
                      selected: true,
                    ),
                  ],
                ),
              )),
            );
            }
  }

  class UpdateData extends StatefulWidget {

    
  
  final DocumentSnapshot crud;  

  UpdateData({this.crud});
 
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController nameController=new TextEditingController();
  TextEditingController gradeController=new TextEditingController();
  TextEditingController addressController=new TextEditingController();
  DocumentSnapshot item;
  final db = Firestore.instance;
    //DocumentSnapshot _currentDocument;
 /* _updateData() async {
    await db
        .collection('CRUD')
        .document(_currentDocument.documentID)
        .updateData({'student name':nameController.text,
          'student grade':gradeController.text,
          'student address':addressController.text,
});
  }*/
  
  
 /*void clickUpdate(item) async {  
   
    await Firestore.instance.collection("CRUD").document('item.documentID').updateData({  
          'student name':nameController.text,
          'student grade':gradeController.text,
          'student address':addressController.text,
          
    }).then((querySnapshot) {  
        clearForm();  
            }).catchError((e) {  
                print(e);  
            });  
        }*/
      
        
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Edit Screen'),
         centerTitle: true,
      ),
      body: Container(
                child: Card(
                  child: ListView(
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: TextField(
                      controller: nameController,
                       decoration: InputDecoration(hintText: 'Enter name'),
                       
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: TextField(
                      controller:gradeController,
                      decoration: InputDecoration(hintText: 'Enter grade'),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: TextField(
                      controller: addressController,
                      decoration: InputDecoration(hintText: 'Enter address'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Update'),
                      color: Colors.red,
                      onPressed: (){
    Firestore.instance.collection('CRUD').getDocuments()
  .then((querySnapshot) {
    querySnapshot.documents.forEach((docID) {
      docID.reference.updateData({    
        'student name':nameController.text,
          'student grade':gradeController.text,
          'student address':addressController.text,});
    });   
  });
           
                        },
                    ),
                  ),
                  ],
                ),
              )),
            );
            }
          void clearForm() {}
  }


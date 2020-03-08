//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:async';
//import 'studentdetails.dart';
/*class UpdateData extends StatefulWidget {
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController nameController=new TextEditingController();
  TextEditingController gradeController=new TextEditingController();
  TextEditingController addressController=new TextEditingController();
  DocumentSnapshot doc;
  final db = Firestore.instance;
 
  Future < void > updateData() async {  
    await db.collection("CRUD").document(doc.documentID).updateData({  
          'student name':nameController.text,
          'student grade':gradeController.text,
          'student address':addressController.text,
    }).then((documentReference) {  
        clearForm();  
            }).catchError((e) {  
                print(e);  
            });  
        }  
          
  void deleteata() async{
    await db.collection('CRUD').document(doc.documentID).delete();
  }        
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}*/

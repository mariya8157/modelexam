import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modelexam/feature/screen/page2.dart';

import '../../../main.dart';

class updatePage extends StatefulWidget {
  final String editname;
  final String editage;
  final String editnumber;
  final String edId;
  const updatePage({super.key,
    required this.editname,
    required this.editage,
    required this.editnumber,
    required this.edId});

  @override
  State<updatePage> createState() => _updatePageState();
}

class _updatePageState extends State<updatePage> {


  TextEditingController name1Controller =TextEditingController();
  TextEditingController age1Controller =TextEditingController();
  TextEditingController number1Controller =TextEditingController();

  @override
  void initState() {
    name1Controller.text=widget.editname.toString();
    age1Controller.text=widget.editage.toString();
    number1Controller.text=widget.editnumber.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Details",style: TextStyle(
              fontWeight: FontWeight.w600
          ),),
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.keyboard_return)),
        ),
        body: Padding(
            padding: EdgeInsets.all(width*0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: name1Controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      labelText: "name"
                  ),
                ),
                TextFormField(
                  controller: number1Controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      labelText: "number"
                  ),
                ),
                TextFormField(
                  controller:age1Controller ,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      labelText: "age"
                  ),
                ),
                ElevatedButton(onPressed: () {
                  FirebaseFirestore.instance.collection("detail").doc(widget.edId).update({
                    "name" : name1Controller.text,
                    "age" : int.tryParse(age1Controller.text)!,
                    "number" : int.tryParse(number1Controller.text)!,
                  });

                }, child: Text("Update")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => page2(),));
                }, child: Text("Go to Page"))
              ],
            ),
            ),
        );
    }
}

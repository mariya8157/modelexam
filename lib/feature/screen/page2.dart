import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modelexam/feature/screen/page3.dart';

import '../../../main.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: Container(
            width: width*1,

            // ****stream builder //*********


            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("detail").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: Text("No document found"));
                  }
                  var data=snapshot.data!.docs;
                  return data.length==0?
                  Center(child: Text("No users found")) :
                  ListView.separated(
                    itemCount:data.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context,  index) {
                      return InkWell(
                        onTap: () {
                        },
                        child: Container(
                            height: height*0.16,
                            width: width*1,
                            decoration: BoxDecoration(color:Colors.grey,
                              borderRadius: BorderRadius.circular(width*0.03),
                            ),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Container(
                                  width: width*0.7,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Name:${data[index]["name"].toString()}",
                                          style: TextStyle(
                                              fontSize: width*0.05,
                                              fontWeight: FontWeight.w700)),
                                      Text("Email:${data[index]["email"].toString()}",
                                          style: TextStyle(
                                              fontSize: width*0.05,
                                              fontWeight: FontWeight.w700)),
                                      Text("Ph:${data[index]["number"].toString()}",
                                          style: TextStyle(
                                              fontSize: width*0.04,
                                              fontWeight: FontWeight.w700)),
                                      Text("Age:${data[index]["age"].toString()}",
                                          style: TextStyle(
                                              fontSize: width*0.03
                                          )),
                                      Text("gender:${data[index]["gender"].toString()}",
                                          style: TextStyle(
                                              fontSize: width*0.03
                                          )),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>updatePage(
                                              editname: data[index]["name"],
                                              editage: data[index]["age"].toString(),
                                              editnumber: data[index]["number"].toString(),
                                              edId: data[index]["id"],),));




                                          }, child: Icon(CupertinoIcons.pen)),


                                          ElevatedButton(onPressed: () {
                                            String id=data[index].id.toString();
                                            FirebaseFirestore.instance.collection("detail").doc(id).delete();
                                            Navigator.pop(context);


                                          }, child: Icon(CupertinoIcons.delete))
                                        ],
                                      )

                                    ],
                                  ),

                                ),



                              ],
                            )

                        ),
                      );

                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height*0.01,);

                    },
                  );
                }
            ),
          ),
        ),
      ),

    );
  }
}

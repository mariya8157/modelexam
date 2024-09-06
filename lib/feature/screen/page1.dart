// import 'package:crud_new/riverpord_crudoperation/feature/details_adding/controller/addingController.dart';
// import 'package:crud_new/riverpord_crudoperation/model/reverpordModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modelexam/feature/screen/page2.dart';

import '../../../../main.dart';
import '../../model/reverpordModel.dart';
import '../controller/addingController.dart';

class DetailsAdding extends ConsumerStatefulWidget {
  const DetailsAdding({super.key});

  @override
  ConsumerState<DetailsAdding> createState() => _DetailsAddingState();
}

class _DetailsAddingState extends ConsumerState<DetailsAdding> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController gender=TextEditingController();
  final emailValidation = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  addingData(){
    RiverpordModel reverpordModel=RiverpordModel(
        name: name.text,
        email: email.text,
        number: int.tryParse(number.text),
        age: int.tryParse(age.text),
        gender: gender.text,

        id:  ""

    );
    ref.watch(addingControllerProvider).controlFunc(reverpord: reverpordModel);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Text("Add Details",
            style: TextStyle(
              fontSize: width*0.05,
              fontWeight:FontWeight.w800,
              color: Colors.black
            ),),
            TextFormField(
              controller: name,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w400,
              ),
              decoration:
              InputDecoration(

                  labelText: "Name",
                  labelStyle: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: "please enter your name",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width*0.05,
                  ),
                  border: OutlineInputBorder
                    ( borderRadius: BorderRadius.circular(width*0.03),
                  )
              ),
            ),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w400,
              ),
              autovalidateMode:AutovalidateMode.onUserInteraction ,
              validator: (value) {
                if(!emailValidation.hasMatch(value!)){
                  return "Enter  a valid mail address";
                }
                else
                {
                  return null;
                }
              },
              decoration:InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  fontSize: width*0.04,
                  fontWeight: FontWeight.w600,
                ),
                hintText: "please enter your email",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width*0.05,
                ),
                border:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(width*0.03),
                ),

              ) ,
            ),

            TextFormField(
              controller: number,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w400,
              ),
              autovalidateMode:AutovalidateMode.onUserInteraction ,
              decoration:InputDecoration(
                labelText: "Number",
                labelStyle: TextStyle(
                  fontSize: width*0.04,
                  fontWeight: FontWeight.w600,
                ),
                hintText: "please enter your Number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width*0.05,
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width*0.03),
                ),
              ) ,
            ),
            TextFormField(
              controller: age,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w400,
              ),
              autovalidateMode:AutovalidateMode.onUserInteraction ,
              decoration:InputDecoration(
                labelText: "age",
                labelStyle: TextStyle(
                  fontSize: width*0.04,
                  fontWeight: FontWeight.w600,
                ),
                hintText: "please enter your age",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width*0.05,
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width*0.03),
                ),
              ) ,
            ),
            TextFormField(
              controller: gender,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w400,
              ),
              decoration:
              InputDecoration(

                  labelText: "gender",
                  labelStyle: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: "please enter your name",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width*0.05,
                  ),
                  border: OutlineInputBorder
                    ( borderRadius: BorderRadius.circular(width*0.03),
                  )
              ),
            ),

            ElevatedButton(onPressed: () {
              addingData();


              setState(() {
                name.clear();
                email.clear();
                age.clear();
                number.clear();
                gender.clear();

              });
            },
                child:Text("Add") ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>page2()));
              name.clear();
              email.clear();
              number.clear();
              age.clear();
              gender.clear();


            },
                child:Text("Get") ),
          ],
        ),
      ),
    );
  }
}

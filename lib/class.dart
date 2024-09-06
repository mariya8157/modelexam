
import 'package:flutter_riverpod/flutter_riverpod.dart';
final a=StateProvider<TaskModel>((ref) => TaskModel(number: 6));

class TaskModel{

  int? number;


  TaskModel({

    this.number,

  });
  Map<String,dynamic> toMap(){
    return{

      "number":this.number,




    };

  }

  Half(){
   this.number!/2;
   print(this.number);
  }




}
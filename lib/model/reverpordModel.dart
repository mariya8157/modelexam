class RiverpordModel{
  String? name;
  String?email;
  int? number;
  int? age;
  String? gender;
  String ? id;
  RiverpordModel({
    this.name,
    this.email,
    this.number,
    this.age,
    this.gender,
    this.id
  });
  Map<String,dynamic> toMap(){
    return{
      "name":this.name,
      "email":this.email,
      "number":this.number,
      "age":this.age,
      "gender":this.gender,
      "id":this.id,



    };
  }
  factory RiverpordModel.fromMap(Map<String,dynamic>map){
    return RiverpordModel(
      name: map["name"]??"",
      email: map["email"]??"",
      number: map["number"]??"",
      age: map["age"]??"",
      gender: map["gender"]??"",
      id: map["id"]??"",


    );
  }
  RiverpordModel copyWith({
    String? name,
    String? email,
    int? number,
    int? age,
    String? gender,
    String? id,


  }){
    return RiverpordModel(
      name: name ?? this.name,
      email: name ?? this.email,
      number: number ?? this.number,
      age: age ?? this.age,
      gender: gender?? this.gender,
      id: id ?? this.id,


    );
  }



}
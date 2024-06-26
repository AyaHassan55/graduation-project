class UserModel{
  late String name;
  late String email;
  late String password;
  late String phone;
  String? profilePicture;
  String? graphImage;
  String? userId;
  String? subjectName;
  num? percentage;
  
  UserModel({required this.name,required this.email,required this.phone,required this.profilePicture,required this.userId,
    required this.subjectName,required this.password,required this.percentage , required this.graphImage});
  Map<String, dynamic >toJson(){
    return <String,dynamic>{
      'name':name,
      'email':email,
      'phone':phone,
      'profile picture':profilePicture,
      'userId':userId,
      'password':password,
      'subject name':subjectName,
      'Percentage':percentage,
      'graphUrl':graphImage,

    };
  }
  factory UserModel.fromJson(Map<String,dynamic>json)=>
      UserModel(name: json['name'], email: json['email'],phone: json['phone'], profilePicture: json['profile picture'], userId: json['userId'], subjectName: json['subjectName'],
          password: json['password'], percentage: json['percentage'],graphImage: json['graphUrl']);
}

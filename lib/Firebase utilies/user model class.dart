class MyUser{
  static String collectionName= "MyUser";
 String  Id;
 String ? name;
 String?  email;
 MyUser ({required this.Id ,  this.name='' ,  this.email=''});

  MyUser.fromFireStore(Map<String, dynamic>?DataMap):this(
    email: DataMap!["email"],
    Id: DataMap["id"],
    name: DataMap["name"]

  );

 Map<String,dynamic> toFireStore() {
   return {
     "id" :Id,
     "name":name,
     "email":email
   };
 }

}
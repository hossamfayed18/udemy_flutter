class ShopLogin_model {
 bool ? status ;
String ? message ;
 UserData ?  data ;


ShopLogin_model.From_json( Map<String,dynamic>  json){

  status=json['status'];
  message=json['message'];
  data=json['data']!=null?UserData.From_json(json['data']):null;

}

}

class UserData {

 int ? id ;
 String ? name ;
 String ? email ;
 String ? phone ;
 String ? image ;
 int ? points ;
 int ? credit  ;
 String ? token;

 UserData.From_json(Map<String,dynamic> json){
   id=json['id'];
   name=json['name'];
   email=json['email'];
   phone=json['phone'];
   image=json['image'];
   points=json['points'];
   credit=json['credit'];
   token=json['token'];
 }


}
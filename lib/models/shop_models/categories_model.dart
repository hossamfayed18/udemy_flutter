class Categories_Model {

  bool ? status ;
  Categorydata ?  data ;
  Categories_Model.fromJson(Map<String,dynamic>json){
    status = json['status'];
    data = Categorydata.fromJson(json['data']);
  }
}

class Categorydata {
int ? current_page ;
List<DataList> list  = [];
String ? first_page_url;
int ? from ;
int ?last_page ;
String ? last_page_url ;
String ? path ;
int ? per_page;
int ? to;
int ? total;

Categorydata.fromJson(Map<String,dynamic>json){
  current_page= json['current_page'];
  first_page_url= json['first_page_url'];
  from= json['from'];
  last_page= json['last_page'];
  path= json['path'];
  per_page= json['per_page'];
  to= json['to'];
  total= json['total'];

  json['data'].forEach((element){
   list.add(DataList.fromJson(element));
  });


}



}

class DataList {

int ? id ;
String ? name ;
String ? image ;
DataList.fromJson(Map<String,dynamic>json){
  id =json['id'];
  name =json['name'];
  image =json['image'];
}
}
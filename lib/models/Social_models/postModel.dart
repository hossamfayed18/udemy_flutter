class PostModel {

  String ? name ;
  String ? text ;
  String ? image ;
  String ? postImage ;
  String ? uid ;
  String ? dateTime ;


  PostModel({required this.name,required this.text,required this.postImage,required this.uid,required this.image,required this.dateTime});


  PostModel.Fromjson(Map<String,dynamic>json)
  {
    name =json['name'];
    image =json['image'];
    postImage=json['postImage'];
    uid =json['uid'];
    text =json['text'];
    dateTime =json['dateTime'];

  }


  Map<String,dynamic> toMap() {
    return {
      'name' : name,
      'uid' : uid,
      'image': image,
      'postImage' : postImage,
      'text':text,
      'dateTime':dateTime,
    } ;
  }

}
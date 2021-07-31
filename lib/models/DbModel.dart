class DbModel{
  int _id=0;
  String _name="";
  String _label="";
  String _description="";
  String _color="";
  String _date="";



  int get id => _id;
  String get name => _name;
  String get label => _label;
  String get description => _description;
  String get color => _color;
  String get date => _date;


  DbModel.fromJson(dynamic json){
    _id=json["id"];
    _name=json["name"];
    _label=json["label"];
    _description=json["description"];
    _color=json["color"];
    _date=json["date"];

  }

  Map<String,dynamic> toJson(){
    var map=<String,dynamic>{};
    map["id"]=_id;
    map["name"]=_name;
    map["label"]=_label;
    map["description"]=_description;
    map["color"]=_color;
    map["date"]=_date;


    return map;

  }


}
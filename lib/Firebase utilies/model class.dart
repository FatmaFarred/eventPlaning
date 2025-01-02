


class Event {
  static String CollectionName="Event";
  String ? id;
  String ? Title;
  String ? Description;
  String ? Image;
  DateTime ? Date;
  String ? Time ;
  bool? IsFavorite;
  String ? EventName;

  Event ({this.id= '',
    required this.Title,
    required this.Description,
    required this.Image,
    required this.Date,
    required this.Time,
    this.IsFavorite = false,
    required this.EventName,

  });
  Event.fromfileStore(Map<String,dynamic>?dataMap):this(
    id : dataMap!["id"],
    Title:dataMap["Title"] ,
    Description: dataMap["Description"],
    EventName:dataMap["EventName"] ,
    Date: DateTime.fromMillisecondsSinceEpoch(dataMap["Date"]),
    Image: dataMap["Image"],
    Time: dataMap["Image"],
    IsFavorite: dataMap["IsFavorite"]
  );

  Map<String,dynamic>toFireStore (event){
    return {
    "id":id  ,
     "Title":Title,
      "Description" :Description,
      "Image":Image,
      "Date":Date!.millisecondsSinceEpoch,
      "Time":Time,
      "IsFavorite":IsFavorite,
      "EventName": EventName
    };

  }




}
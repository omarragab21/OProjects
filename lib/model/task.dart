

class TaskModel{
  int ?id; 
 String? title;
  String? time;
  String ?date;
  String ?status;
  int ? isCompleted ;

  TaskModel({  this.id,  required this.title, required this.time,  required this.date, required this.status, required this.isCompleted});

TaskModel.fromJson(Map<dynamic,dynamic> json){
id = json['id'] ?? '';
title = json['title'] ?? '';
time = json['time'] ?? '';
date = json['date'] ?? '';
status = json['status'] ?? '';
isCompleted = json['isCompleted']  ; 
}
toMap(){
  return{
    'title':title,
    'time': time,
    'date':date,
    'status':status,
    'isCompleted':isCompleted
  };
}

}
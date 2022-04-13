
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/componets/componts.dart';
import 'package:task/db/db_helper.dart';
import 'package:task/model/task.dart';
import 'package:task/notification/notifi_helper.dart';
import 'package:task/view/home_layout.dart';
import 'package:task/view/screens/delete.dart';
import 'package:task/view/screens/done.dart';
import 'package:task/view/screens/task.dart';

class TasksController extends GetxController{
int selectedIndex =0;
bool isLoading= false;
List<TaskModel> doneTasks = [];

List<TaskModel> dailyTasks = [];

List<String> appTitle = [
  'Task screen',
  'Done screen',
 
];
@override
  void onInit() {
    getAllTask();
    super.onInit();
  }
void changeIsLoading(){
  isLoading != isLoading;
  update();
}
List<BottomNavigationBarItem> navBottmItems = const[
BottomNavigationBarItem(icon: const Icon(Icons.menu), label: 'tasks'),
BottomNavigationBarItem(icon: const Icon(Icons.done_all_rounded), label: 'done'),


];

List<Widget> screens= [
  TaskScreenLayout(),
  DoneScreenLayout(),
  
];

void selectedIndexChange(int value){
selectedIndex = value ;
update();   
}


addTaskToDb(String title,String status,String time,String date)async{
  changeIsLoading();
DateTime  formatDate = DateTime.parse (date);
print(formatDate.day);

  final format = DateFormat.jm();
 TimeOfDay timeOfDay =  TimeOfDay.fromDateTime(format.parse(time));
 print(timeOfDay.hour);

TaskModel tasks=  await DBHelper().add(TaskModel(title: title, time: time, date: date, status: status, isCompleted: 0));

  NotifiHelper().addscheduleNotification(formatDate, timeOfDay, tasks.id!, tasks);
  
changeIsLoading();
Get.snackbar('Add Task SuccessFully', 'Add Task SuccessFully');
getAllTask();
Get.off(()=>HomeScreenLayout()); 
}


void getAllTask()async{
 dailyTasks.clear();
 doneTasks.clear();
 List<TaskModel> allTask = await DBHelper().getTasks();
  
for(int i=0 ; i< allTask.length;i++){
  print(allTask[i].isCompleted);
  if(allTask[i].isCompleted == 0){
    dailyTasks.add(allTask[i]);
  }else if(allTask[i].isCompleted ==1){
    doneTasks.add(allTask[i]);
  }
}
  print(dailyTasks);
  print(doneTasks);
 update();
}


void deleteTaskFromDb(int id)async{
  changeIsLoading();
  await DBHelper().delete(id);
  NotifiHelper().deleteNotification(id);
  changeIsLoading();
   
  getAllTask();
  Get.snackbar('Delete Task SuccessFully', 'Delete Task SuccessFully');
  update();
}
void updateTask(int id)async{
 changeIsLoading();
 
 await DBHelper().update(id);
  getAllTask();
 changeIsLoading();
 Get.snackbar('Update Task SuccessFully', 'update Task SuccessFully');

 update(); 
}



}
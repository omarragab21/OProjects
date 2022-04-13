import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/controller/task_controller.dart';
import 'package:task/view/widgets/date_form_feild.dart';
import 'package:task/view/widgets/text_from_feild.dart';
import 'package:task/view/widgets/time_form_feild.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({ Key? key }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();
var statusController = TextEditingController();

TasksController tasksController = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(17, 30, 184, 1),
        leading: BackButton(color: Colors.white,onPressed: ()=>Get.back(),),
        title:const  Text('Add Task',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top:30,
            left: 12
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const  Text('Title',style:TextStyle(color: Colors.black)),
               const SizedBox(height: 10,),
               MyformTextFeild(controller: titleController, label: 'title', function: (String value){
                 if(value.isEmpty){
                   return 'Please Enter your Title';
                 }
                 return null;
               }, iconData: Icons.title_rounded),
               const SizedBox(height: 10,),
                  const  Text('Status',style:TextStyle(color: Colors.black)),
               const SizedBox(height: 10,),
               MyformTextFeild(controller: statusController, label: 'status', function: (String value){
                 if(value.isEmpty){
                   return 'Please Enter your Status';
                 }
                 return null;
               }, iconData: Icons.text_fields),
               const SizedBox(height: 10,),
               const  Text('Time',style:TextStyle(color: Colors.black)),
               const SizedBox(height: 10,),
               TimeTextFeild(controller: timeController, label: 'time', function: (String value){
                 if(value.isEmpty){
                   return 'Please Enter your Time';
                 }
                 return null;
               }, iconData: Icons.timelapse,),
               const SizedBox(height: 10,),
                const  Text('Date',style:TextStyle(color: Colors.black)),
                 const SizedBox(height: 10,),
               DateTextFeild(controller: dateController, label: 'Date', function: (String value){
                 if(value.isEmpty){
                   return 'Please Enter your Date';
                 }
                 return null;
               }, iconData: Icons.calendar_today,),
               const SizedBox(height: 60,),
               InkWell(
                 onTap: (){
                   if(formKey.currentState!.validate()){
                     print(timeController.text);
                      tasksController.addTaskToDb(titleController.text.trim(), statusController.text.trim(), timeController.text.trim(), dateController.text.trim());
                   }
                 },
                 child: Container(
                   height: 40,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.blueAccent[200]
                   ),
                   child: const Center(
                     child: Text('add Task',style: TextStyle(color: Colors.white),),
                   ),
                 ),
               )
               
          
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
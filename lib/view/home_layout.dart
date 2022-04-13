import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/componets/componts.dart';
import 'package:task/controller/task_controller.dart';
import 'package:task/db/db_helper.dart';
import 'package:task/model/task.dart';
import 'package:task/view/add_task.dart';
import 'package:task/view/widgets/text_from_feild.dart';

class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({ Key? key }) : super(key: key);

  @override
  State<HomeScreenLayout> createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {
var scaffoldKey = GlobalKey<ScaffoldState>();
TasksController _tasksController = Get.find();



  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
      init: TasksController(),
      builder:(value)=> Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(64, 137, 255, 1),
          title: Text(value.appTitle[value.selectedIndex]),
          actions: [
            TextButton(onPressed: (){
              Get.to(()=>const AddTaskScreen());
            }, child: const Text('add Task',style:TextStyle(color: Colors.white),))
          ],

        ),
       body: value.screens[value.selectedIndex],
               
      bottomNavigationBar: BottomNavigationBar(
        items: value.navBottmItems,
        currentIndex: value.selectedIndex,
        onTap: (int index){
          value.selectedIndexChange(index);
        },
        unselectedItemColor: const Color.fromRGBO(0, 0, 0, 1),
        selectedItemColor:const Color.fromRGBO(225, 232, 250, 1) ,
        backgroundColor:const Color.fromRGBO(64, 137, 255, 1) ,
      ),
      ),
    );
  }
}
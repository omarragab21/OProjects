import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/task_controller.dart';
import 'package:task/model/task.dart';

class DoneScreenLayout extends StatelessWidget {
  const DoneScreenLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
      init: TasksController(),
      builder:(taskss)=> Container(
        child: ConditionalBuilder(
          condition: taskss.doneTasks.length > 0, 
          builder: (context)=>ListView.separated(itemBuilder: (context,i)=>taskItemWidget(taskss.doneTasks[i],context), 
          separatorBuilder: (context,i)=>const SizedBox(height: 20,), 
          itemCount: taskss.doneTasks.length), 
          fallback: (context)=>loadingWidge()),
      ),
    );
  }
  Widget loadingWidge()=>Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.list_alt_rounded,size: 250,color: Colors.grey,),
      SizedBox(height: 10,),
      Text('No Tasks Here',style: TextStyle(
        color: Colors.grey,
        fontSize: 30,
      ),)
    ],
  ),
);

Widget taskItemWidget(TaskModel taskModel,context)=>GetBuilder<TasksController>(
  init: TasksController(),
  builder:(task)=>   InkWell(
  
    onTap: (){
  
      showBottomSheet(context: context, builder: (innerContext)=>Container(
  
        height: 250,
  
        width: double.infinity,
  
        decoration:  BoxDecoration(
  
          borderRadius: const BorderRadius.only(
  
            topLeft: Radius.circular(20),
  
            topRight: Radius.circular(20)
  
          ),
  
          color: Colors.grey[200]
  
        ),
  
        child: Padding(
  
          padding: const EdgeInsets.all(20.0),
  
          child: Column(
  
            crossAxisAlignment: CrossAxisAlignment.center,
  
            mainAxisAlignment: MainAxisAlignment.center,
  
            children: [
  
              TextButton(onPressed: (){
  
                task.deleteTaskFromDb(taskModel.id!);
                Get.back();
  
              }, child: Container(
  
                height: 50,
  
                width: double.infinity,
  
                decoration: BoxDecoration(
  
                  borderRadius: BorderRadius.circular(20),
  
                  color: Colors.pinkAccent
  
                ),
  
                child: Center(child: Text('Delete Task ',style: TextStyle(color: Colors.white),),),
  
              )
  
              ),
  
              const SizedBox(height: 10,),
  
  
            ],
  
          ),
  
        ),
  
      ));
  
    },
  
    child:   Card(
  
    
  
      color:  Color.fromRGBO(211, 240, 24, 1),
  
    
  
      shadowColor: Color.fromRGBO(35, 36, 27, 1),
  
    
  
      elevation: 0.9,
  
    
  
      clipBehavior: Clip.antiAliasWithSaveLayer,
  
    
  
      child: Padding(
  
    
  
        padding: const EdgeInsets.all(12.0),
  
    
  
        child: Column(
  
    
  
          crossAxisAlignment: CrossAxisAlignment.start,
  
    
  
          children: [
  
    
  
            Row(
  
    
  
              children: [
  
    
  
               const  Text('Title Task  :',style:  TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                )),
  
    
  
               const SizedBox(width: 20,),
  
    
  
                Text(taskModel.title!,style: const TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                ),),
  
    
  
              ],
  
    
  
            ),
  
    
  
           const SizedBox(height: 15,),
  
    
  
           Row(
  
    
  
              children: [
  
    
  
               const  Text('Time Task  :',style:  TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                )),
  
    
  
               const SizedBox(width: 20,),
  
    
  
                Text(taskModel.time!,style: const TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                ),),
  
    
  
              ],
  
    
  
            ),
  
    
  
        const SizedBox(height: 15,),
  
    
  
      Row(
  
    
  
              children: [
  
    
  
               const  Text('Date Task  :',style:  TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                )),
  
    
  
               const SizedBox(width: 20,),
  
    
  
                Text(taskModel.date!,style: const TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                ),),
  
    
  
              ],
  
    
  
            ),
  
    
  
            const SizedBox(height: 15,),
  
    
  
      Row(
  
    
  
              children: [
  
    
  
               const  Text('Status Task  :',style:  TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                )),
  
    
  
               const SizedBox(width: 20,),
  
    
  
                Text(taskModel.status!,style: const TextStyle(
  
    
  
                  color: Color.fromRGBO(231, 232, 209, 1),
  
    
  
                  fontSize: 15
  
    
  
                ),),
  
    
  
              ],
  
    
  
            )
  
    
  
       
  
    
  
    
  
    
  
          ],
  
    
  
        ),
  
    
  
      ),
  
    
  
    
  
    
  
    ),
  
  ),
);
}
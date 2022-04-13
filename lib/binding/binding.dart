import 'package:get/get.dart';
import 'package:task/controller/task_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TasksController>(() =>TasksController() );
  }

}
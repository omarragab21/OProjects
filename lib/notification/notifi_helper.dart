import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:task/model/task.dart';
import 'package:task/view/home_layout.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifiHelper{
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

 void init()async{
  const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
final MacOSInitializationSettings initializationSettingsMacOS =
    MacOSInitializationSettings();
final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS);
await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onSelectNotification: selectNotification);
} 



void selectNotification(String? payload) async {
  Get.to(()=>const HomeScreenLayout());
}

void addscheduleNotification(DateTime dateTime ,TimeOfDay timeOfDay,int id,TaskModel taskModel) async{
 await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    '${taskModel.title}',
    '${taskModel.status}',
    tz.TZDateTime(tz.local,dateTime.year,dateTime.month,dateTime.day,timeOfDay.hour,timeOfDay.minute),
    const NotificationDetails(
        android: AndroidNotificationDetails(
            'your channel id', 'your channel name',
            channelDescription: 'your channel description')),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,);
}

void deleteNotification(int id) async{
 await flutterLocalNotificationsPlugin.cancel(id);
}

}
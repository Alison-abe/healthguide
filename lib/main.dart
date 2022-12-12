import 'package:flutter/material.dart';
import 'package:healthguide/db/functions/db_functions1.dart';
import 'package:healthguide/db/model/data_model1.dart';
import 'package:healthguide/splashscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cron/cron.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(AccountAdapter().typeId)){
    Hive.registerAdapter(AccountAdapter());
  }

  AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  null,
  [
    NotificationChannel(
        channelKey: 'key1',
        channelName: 'healthguide',
        channelDescription: 'Notification for reminding',
        defaultColor:const Color.fromARGB(255, 153, 106, 223),
        ledColor: Colors.white,
        playSound: true,
        enableLights:true,
        enableVibration: true
    )
  ],  
);

 final cron2=Cron();
  cron2.schedule(Schedule.parse('* */24 * * *'), () async=> {
  clear_notes()
});
  final cron=Cron();
  cron.schedule(Schedule.parse('* */3 * * *'),()async =>{
     AwesomeNotifications().createNotification(
  content: NotificationContent(
      id: 1,
      channelKey: 'key1',
      title: 'Healthguide',
      body: 'Time for your next glass of water',
  ))
  } );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const SplashScreen(),
    );
  }
}


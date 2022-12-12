
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthguide/db/functions/db_functions1.dart';
import 'package:healthguide/db/model/data_model1.dart';
class WaterReminder extends StatefulWidget {
  final Account newaccount;
  const WaterReminder({Key? key,required this.newaccount}) : super(key: key);

  @override
  State<WaterReminder> createState() => _WaterReminderState();
}
Random random=Random();
var datetime=DateTime.now();
String time="",hour="",minute="",second="";
List<String> quotes = <String>["Drink your glass of water slowly with some small sips","Do not drink water immediately after eating","Hold the water the mouth for a while before swallowing","Do not drink cold water immediately after hot drinks"];
int index=0;
class _WaterReminderState extends State<WaterReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                const Image(
                  width: 90,
                  height: 100,
                  image: AssetImage('assets/images/water.jpg')),
                  Container(
                     height: 70,
                     width: 170,
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 153, 197, 233) ,
                        border: Border.all(color: const Color.fromARGB(255, 153, 197, 233)),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                      child: Center(
                        child:Text(quotes[index],)
                      ),
                  )
              ],
            ),
            Container(
              height: 200,
              width:200,
              margin:const EdgeInsets.all(100.0),
              decoration:const BoxDecoration(color: Color.fromARGB(255, 226, 226, 226),
                  shape: BoxShape.circle
              ),
             child: Column(
              children: [
                IconButton(onPressed: ()async{
                  setState(() {
                    index=random.nextInt(4);
                    datetime=DateTime.now();
                    hour=datetime.hour.toString();
                    minute=datetime.minute.toString();
                    second=datetime.second.toString();
                    time='$hour - $minute - $second';
                    addDetails(widget.newaccount.email, 7,time );
                  });
              }, icon:const Icon(Icons.add_box_rounded)),
              const Text("125 ml")
              ],
             ),
            ),
            ListView.separated(itemBuilder: (BuildContext context,int index1){
              return const ListTile(
                  
                  leading: Icon(Icons.water_drop_sharp),
                  subtitle:Text('125ml'),
              );
            }, 
            separatorBuilder: (BuildContext context, int index1) => const Divider(), 
            itemCount: 3)
          ],
        ),
      ),
    );
  }
}
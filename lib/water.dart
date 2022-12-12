import 'dart:math';
import 'package:flutter/material.dart';
import 'package:healthguide/db/functions/db_functions1.dart';
import 'package:healthguide/db/model/data_model1.dart';

class WaterReminder extends StatefulWidget {
  Account newaccountw;
  WaterReminder({Key? key, required this.newaccountw,int drank=0}) : super(key: key);
  @override
  State<WaterReminder> createState() => _WaterReminderState();
}
int drank=0;
Random random = Random();
var datetime = DateTime.now();
String time = "", hour = "", minute = "", second = "";
String drankstrng = drank.toString();
List<String> quotes = <String>[
  "Drink your glass of water slowly with some small sips",
  "Do not drink water immediately after eating",
  "Hold the water the mouth for a while before swallowing",
  "Do not drink cold water immediately after hot drinks"
];
int indexq = 0;
class _WaterReminderState extends State<WaterReminder> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      drank=widget.newaccountw.drank;
      drankstrng=drank.toString();
    });
    return Scaffold(
        body: SafeArea(child: 
        SingleChildScrollView(
            child: Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(
                    width: 90,
                    height: 100,
                    image: AssetImage('assets/images/water.jpg')),
                Container(
                  height: 70,
                  width: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 153, 197, 233),
                      border: Border.all(
                          color: const Color.fromARGB(255, 153, 197, 233)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Text(
                    quotes[indexq],
                  )),
                )
              ],
            ),
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(50.0),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$drankstrng/2000',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30,),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          
                          indexq = random.nextInt(4);
                          drank = drank + 125;
                          addDetails(widget.newaccountw.email,8,drank.toString());
                          drankstrng=drank.toString();
                          datetime = DateTime.now();
                          hour = datetime.hour.toString();
                          minute = datetime.minute.toString();
                          second = datetime.second.toString();
                          time = '$hour:$minute';
                          addDetails(widget.newaccountw.email, 7, time);
                        });
                      },
                      icon: const Icon(Icons.add_box_rounded)),
                  const Text("125 ml")
                ],
              ),
            ),
            const Text("Today's records",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ConstrainedBox(
              constraints:  BoxConstraints(maxHeight: widget.newaccountw.notes.length*100),
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(widget.newaccountw.notes[index]),
                      leading: const Icon(Icons.water_drop_sharp),
                      subtitle: const Text('125ml'),
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:widget.newaccountw.notes.length ),
            )
          ],
        ),
      ],
    ))
        ));
  }
}

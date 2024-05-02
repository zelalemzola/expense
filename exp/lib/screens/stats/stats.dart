import 'package:exp/screens/stats/chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Transaction",
             style:TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
               color: Colors.white

             ) ,
             ),
            SizedBox(height:20),
            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.width/1.3 ,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),

              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12,20,12,12),
                child: MyChart(),
              )

              ),

          ],
        ),
      ),
    );
  }
}

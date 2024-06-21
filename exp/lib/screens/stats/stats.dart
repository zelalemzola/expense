import 'package:exp/screens/stats/chart.dart';
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
             const Text("Transaction",
             style:TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
               color: Colors.white

             ) ,
             ),
            const SizedBox(height:20),
            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.width/1.3 ,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),

              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(12,20,12,12),
                child: MyChart(),
              )

              ),

          ],
        ),
      ),
    );
  }
}

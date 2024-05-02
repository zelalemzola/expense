import 'dart:math';

import 'package:exp/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration:BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow[700],
                          )
                        ),
                        Icon(CupertinoIcons.person_fill,
                         color:Colors.white,
                        )
                      ],
                    ),
                    SizedBox( width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome!",style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.outline,
                        ),),
                        Text("Jhon Doe",
                        style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:Colors.white
                            // color:Theme.of(context).colorScheme.onBackground
                        )
                        ),
                      ],
                    ),

                  ],
                ),
                IconButton(onPressed:(){}, icon: Icon(CupertinoIcons.settings,color: Colors.yellow[800],size: 30,fill: 1,),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade600,
                    offset: Offset(3, 3)
                  )
                ],
                gradient: LinearGradient(
                    colors:[
                      // Theme.of(context).colorScheme.primary,
                      // Theme.of(context).colorScheme.secondary,
                      // Theme.of(context).colorScheme.tertiary,
                      Colors.grey.shade900,
                      Colors.black,
                      Colors.yellow.shade800,
                      Colors.black,
                      Colors.grey.shade800,
                    ],
                  transform: const GradientRotation( pi / 4),
                )
              ),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Balance",
                    style:TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  SizedBox(height: 12,),
                  Text("\$ 5000.00",
                      style:TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle
                              ),
                              child: Center(
                               child: Icon(
                                   CupertinoIcons.arrow_up,
                                 size: 16,
                                 color: Colors.greenAccent,

                               ),
                              ),

                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Income",
                                    style:TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                ),
                                Text("\$ 5800.00",
                                    style:TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white30,
                                  shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.arrow_down,
                                  size: 14,
                                  color: Colors.red,
                                ),
                              ),

                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expense",
                                  style:TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text("\$ 800.00",
                                  style:TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text("Transactions",
                style:TextStyle(
                  fontSize:16,
                  // color:Theme.of(context).colorScheme.onBackground,
                  color: Colors.white,
                  fontWeight:FontWeight.bold,
                ),
                ),
                GestureDetector(
                  onTap:(){

                  },
                  child: Text("View All",
                    style:TextStyle(
                      fontSize:14,
                      color:Theme.of(context).colorScheme.outline,
                      fontWeight:FontWeight.w400,
                    ),
                  ),
                ),

              ]
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: transactionsData.length,
                itemBuilder: (context,int i){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                         color:Colors.grey[900],
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                          // gradient: LinearGradient(
                          //   colors:[
                          //     // Theme.of(context).colorScheme.primary,
                          //     // Theme.of(context).colorScheme.secondary,
                          //     // Theme.of(context).colorScheme.tertiary,
                          //     Colors.black,
                          //     Colors.yellow.shade800,
                          //     Colors.black,
                          //   ],
                          //   transform: const GradientRotation( pi / 4),
                          // )

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: transactionsData[i]['color'],
                                        shape: BoxShape.circle
                                      ),
                                    ),
                                    transactionsData[i]['icon'],


                                  ],
                                ),
                                SizedBox(width: 14,),
                                Text(transactionsData[i]['name'],
                                  style:TextStyle(
                                    fontSize:16,
                                    // color:Theme.of(context).colorScheme.onBackground,
                                    color: Colors.white,
                                    fontWeight:FontWeight.w500,
                                  ),
                                ),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(transactionsData[i]['totalAmount'],
                                  style:TextStyle(
                                    fontSize:14,
                                    // color:Theme.of(context).colorScheme.onBackground,
                                    // color:Theme.of(context).colorScheme.outline,
                                    color:Colors.yellow[800],
                                    fontWeight:FontWeight.w400,
                                  ),
                                ),

                                Text(transactionsData[i]['date'],
                                  style:TextStyle(
                                    fontSize:14,
                                    color:Theme.of(context).colorScheme.outline,
                                    fontWeight:FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              
              
              ),
            )

          ],
        ),
      ),
    );
  }
}

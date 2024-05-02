import "dart:math";

import "package:exp/screens/add_expense/views/add_expense.dart";
import "package:exp/screens/home/views/main_screen.dart";
import "package:exp/screens/stats/stats.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var widgetList=[
    MainScreen(),
    StatScreen(),
  ];
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //backgroundColor: Colors.white,
      backgroundColor: Colors.grey[800],
      body: widgetList[index],
      bottomNavigationBar: ClipRRect(
        borderRadius:BorderRadius.vertical(
          top:Radius.circular(30)
        ),
        child: BottomNavigationBar(
          onTap: (value){
             setState(() {
               index= value;

             });
          },
          currentIndex: index,
          fixedColor: Colors.black,
          backgroundColor: Colors.yellow[800],
          showSelectedLabels: false,
          showUnselectedLabels: false,

          elevation: 40,
          items: [
            BottomNavigationBarItem(
              icon:index ==0 ? Icon(Icons.home_filled,size: 26,):Icon(Icons.home,size: 26,),
              label: "home",

            ),
            BottomNavigationBarItem(
                icon:index==1?Icon(CupertinoIcons.graph_square_fill):Icon(CupertinoIcons.graph_square),
                label: "stats",
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder:(BuildContext context)=> const AddExpense(),
              )
          );
        },
          shape: CircleBorder(),

        child: Container(
          width: 70,
          height: 70,
          decoration:BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
              //   Theme.of(context).colorScheme.tertiary,
              //   Theme.of(context).colorScheme.secondary,
              //   Theme.of(context).colorScheme.primary,
                Colors.black,
                Colors.yellow.shade800,
                Colors.grey.shade400,
               ],

              transform: const GradientRotation( pi / 4),
            ),
          ),
          child: Icon(
            CupertinoIcons.add,
            color: Colors.white,
            size: 28,


          ),
        )
      )
    );
  }
}

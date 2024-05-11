import "dart:math";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_colorpicker/flutter_colorpicker.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:intl/intl.dart";

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  List<String> myCategoriesIcon = [
    "entertainment",
    "food",
    "home",
    "pet",
    "shopping",
    "tech",
    "travel",
  ];

  @override
  void initState() {
    // TODO: implement initState
    dateController.text= DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          title: Text("Add Expense",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey[800]),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox( height: 16,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],

                    prefixIcon: Icon(CupertinoIcons.money_dollar,color: Colors.yellow[800],size: 24,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
              ),
              SizedBox( height: 32,),
              TextFormField(
                readOnly: true,
                onTap: (){

                },
                controller: categoryController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],

                  prefixIcon: Icon(CupertinoIcons.list_bullet,color: Colors.yellow[800],size: 24,),
                  hintText: "Category",
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  suffixIcon: IconButton(
                    onPressed: (){
                      showDialog(

                          context: context,
                          builder: (ctx){
                            bool isExpanded = false;
                            String iconSelected = '';
                            Color categoryColor = const Color.fromRGBO(33, 33, 33, 1);
                            return StatefulBuilder(
                              builder:(context,setState) {
                                return AlertDialog(
                                title:Center(
                                  child:Text("Create a Category",
                                  style: TextStyle(
                                    color:Colors.white,

                                  ),
                                ),
                                ),

                                backgroundColor: Colors.grey[800],
                                surfaceTintColor:Colors.black ,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    SizedBox(
                                      width:MediaQuery.of(context).size.width,
                                      child: TextFormField(
                                       // controller: dateController,


                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[900],
                                          isDense:true,

                                          hintText: "Name",
                                          hintStyle: TextStyle(color: Colors.grey[700]),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide.none
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16,),
                                    TextFormField(
                                      // controller: dateController,
                                      readOnly:true,
                                      onTap:(){
                                          setState((){
                                              isExpanded = !isExpanded;
                                                     }
                                                     );
                                               },
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[900],
                                        isDense:true,
                                        hintText: "Icon",
                                        suffixIcon: Icon(CupertinoIcons.chevron_down,size: 12,),
                                        hintStyle: TextStyle(color: Colors.grey[700]),
                                        border: OutlineInputBorder(
                                            borderRadius:isExpanded ? BorderRadius.vertical(
                                                top: Radius.circular(12)
                                            ):BorderRadius.circular(12),
                                            borderSide: BorderSide.none
                                        ),
                                      ),
                                    ),
                                    isExpanded ? Container(

                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(12)
                                        ),

                                      ),
                                      child: GridView.builder(
                                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5,  

                                        ),
                                        itemCount:myCategoriesIcon.length,
                                        itemBuilder: (context,int i){
                                          return Padding(


                                            padding: const EdgeInsets.all(4.0),
                                            child: GestureDetector(
                                              onTap:() {
                                                setState (() {
                                                  iconSelected = myCategoriesIcon[i];
                                                });
                                              },
                                              child: Container(
                                              
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                color: Colors.grey[800],
                                                  border: Border.all(
                                                    width: 3,
                                                    color: iconSelected == myCategoriesIcon[i] 
                                                    ? Colors.blue
                                                    : Colors.grey
                                                  ),
                                                  borderRadius: BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                    image: AssetImage("images/${myCategoriesIcon[i]}.png"),
                                                  )
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ):SizedBox(),
                                    SizedBox(height: 16,),
                                    TextFormField(
                                      // controller: dateController,
                                      onTap: () {
                                         showDialog(
                                           context: context,
                                           builder: (ctx2) {
                                             return AlertDialog(
                                               content: Column(
                                                 mainAxisSize: MainAxisSize.min,
                                                 children: [
                                                   ColorPicker(
                                                     pickerColor: categoryColor,
                                                     onColorChanged: (value) {
                                                      setState(() {
                                                        categoryColor = value;
                                                      });
                                                     },
                                                   ),
                                                   SizedBox(
                                                      width: double.infinity,
                                                      height: 50,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(ctx2);
                                                        },
                                                        style: TextButton.styleFrom(
                                                          backgroundColor: Colors.black,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                          'Save',
                                                          style: TextStyle(
                                                            fontSize: 22,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                 ], 
                                               ), 
                                             ); 
                                           }, 
                                         ); 
                                       }, 

                                      textAlignVertical: TextAlignVertical.center,
                                      readOnly: true,

                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: categoryColor,
                                        isDense:true,
                                        hintText: "Color",
                                        hintStyle: TextStyle(color: Colors.grey[700]),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide.none
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16,),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          //Create Category object and POP
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              );
                              },
                            );
                          }
                      );
                    },
                   icon:Icon(
                     CupertinoIcons.plus_circle_fill,
                     color: Colors.yellow[800],
                     size: 24,
                   )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              SizedBox( height: 16,),
              TextFormField(
                controller: dateController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365))

                  );
                  if(newDate != null){
                    setState(() {
                      dateController.text= DateFormat('dd/MM/yyyy').format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],

                  prefixIcon: Icon(CupertinoIcons.calendar_badge_plus,color: Colors.yellow[800],size: 24,),
                  hintText: "Date",
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              SizedBox( height: 16,),
              SizedBox(

                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(

                    onPressed: (){},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  child: Text("Save",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

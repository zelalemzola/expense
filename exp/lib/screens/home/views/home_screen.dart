import "dart:math";

import "package:exp/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart";
import "package:exp/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart";
import "package:exp/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart";
import "package:exp/screens/add_expense/views/add_expense.dart";
import "package:exp/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart";
import "package:exp/screens/home/views/main_screen.dart";
import "package:exp/screens/stats/stats.dart";
import "package:expense_repository/expense_repository.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpensesBloc, GetExpensesState>(
        builder: (context, state) {
      if (state is GetExpensesSuccess) {
        return Scaffold(
            //backgroundColor: Colors.white,
            backgroundColor: Colors.grey[800],
            body: index == 0 ? MainScreen(state.expenses) : StatScreen(),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    index = value;
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
                    icon: index == 0
                        ? Icon(
                            Icons.home_filled,
                            size: 26,
                          )
                        : Icon(
                            Icons.home,
                            size: 26,
                          ),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: index == 1
                        ? Icon(CupertinoIcons.graph_square_fill)
                        : Icon(CupertinoIcons.graph_square),
                    label: "stats",
                  )
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  var newExpense = await Navigator.push(
                      context,
                      MaterialPageRoute<Expense>(
                        builder: (BuildContext context) => MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => CreateCategoryBloc(
                                FirebaseExpenseRepo(),
                              ),
                            ),
                            BlocProvider(
                              create: (context) =>
                                  GetCategoriesBloc(FirebaseExpenseRepo())
                                    ..add(GetCategories()),
                            ),
                            BlocProvider(
                              create: (context) => CreateExpenseBloc(
                                FirebaseExpenseRepo(),
                              ),
                            ),
                          ],
                          child: AddExpense(),
                        ),
                      ));
                  if (newExpense != null) {
                    setState(() {
                      state.expenses.insert(0, newExpense);
                    });
                  }
                },
                shape: CircleBorder(),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
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
                      transform: const GradientRotation(pi / 4),
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                )));
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}

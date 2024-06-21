import "package:exp/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart";
import "package:exp/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart";
import "package:exp/screens/add_expense/views/category_creation.dart";
import "package:expense_repository/expense_repository.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  //DateTime selectDate = DateTime.now();
  late Expense expense;
  bool isLoading = false;
  int selectedIndex = -1;

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
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    expense = Expense.empty;
    expense.expenseId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc, CreateExpenseState>(
      listener: (context, state) {
        if (state is CreateExpenseSuccess) {
          Navigator.pop(context, expense);
        } else if (state is CreateExpenseLoading) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.grey[800],
          appBar: AppBar(
            backgroundColor: Colors.yellow[800],
            title: Text(
              "Add Expense",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.grey[800]),
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
            builder: (context, state) {
              if (state is GetCategoriesSuccess) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            controller: expenseController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[900],
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Birr',
                                  style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          readOnly: true,
                          onTap: () {},
                          controller: categoryController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[900],
                            prefixIcon: Icon(
                              CupertinoIcons.list_bullet,
                              color: Colors.yellow[800],
                              size: 24,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  var newCategory =
                                      await getCategoryCreation(context);
                                  setState(() {
                                    state.categories.insert(0, newCategory);
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.plus_circle_fill,
                                  color: Colors.yellow[800],
                                  size: 24,
                                )),
                            hintText: "Category",
                            hintStyle: TextStyle(color: Colors.yellow[800]),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                borderSide: BorderSide.none),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(97, 97, 97, 1),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12)),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  itemCount: state.categories.length,
                                  itemBuilder: (context, int i) {
                                    return Card(
                                      child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            expense.category =
                                                state.categories[i];
                                            selectedIndex = i;
                                          });
                                        },
                                        leading: Image.asset(
                                          'images/${state.categories[i].icon}.png',
                                          scale: 2,
                                        ),
                                        title: Text(
                                          state.categories[i].name,
                                        ),
                                        tileColor:
                                            Color(state.categories[i].color),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: selectedIndex == i
                                                ? Colors.blue
                                                : Colors.transparent,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    );
                                  })),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: dateController,
                          textAlignVertical: TextAlignVertical.center,
                          readOnly: true,
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: expense.date,
                              firstDate: DateTime.now().subtract(
                                  const Duration(days: 36500)), // 100 years ago
                              lastDate: DateTime.now(),
                            );
                            if (newDate != null) {
                              setState(() {
                                dateController.text =
                                    DateFormat('dd/MM/yyyy').format(newDate);
                                //selectDate = newDate;
                                expense.date = newDate;
                              });
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[900],
                            prefixIcon: Icon(
                              CupertinoIcons.calendar_badge_plus,
                              color: Colors.yellow[800],
                              size: 24,
                            ),
                            hintText: "Date",
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: kToolbarHeight,
                          child: isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : TextButton(
                                  onPressed: () {
                                    setState(() {
                                      expense.amount =
                                          double.parse(expenseController.text);
                                    });

                                    context
                                        .read<CreateExpenseBloc>()
                                        .add(CreateExpense(expense));
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

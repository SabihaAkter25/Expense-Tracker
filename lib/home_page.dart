import 'package:expence_tracker/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'fund_condition_widget.dart';
import 'item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> options = ["expense", "income"];
List items = [
  ExpenseModel(amount: 1000, date: DateTime.now(), isIncome: true, item: "Computer")
];

class _HomePageState extends State<HomePage> {
  DateTime? pickDate;
  String currentOption = options[0];
  final itemController = TextEditingController();
  final amountController = TextEditingController();
  final datetController = TextEditingController();
  int deposit = 0;
  int spentMoney = 0;
  int income = 0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,  // Ensures content resizes when the keyboard shows
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,  // Allows full screen dialog when the keyboard appears
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Add Transaction",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: itemController,
                          decoration: const InputDecoration(
                            hintText: "Enter the Item",
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: amountController,
                          decoration: const InputDecoration(
                            hintText: "Enter the Amount",
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onTap: () async {
                            pickDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            String convertedDate =
                            DateFormat.yMMMd().format(pickDate!);
                            datetController.text = convertedDate;
                            setState(() {});
                          },
                          controller: datetController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: "Enter the Date",
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        RadioMenuButton(
                          value: options[0],
                          groupValue: currentOption,
                          onChanged: (expense) {
                            setState(() {
                              currentOption = expense.toString();
                            });
                          },
                          child: const Text("Expense"),
                        ),
                        RadioMenuButton(
                          value: options[1],
                          groupValue: currentOption,
                          onChanged: (income) {
                            setState(() {
                              currentOption = income.toString();
                            });
                          },
                          child: const Text("Income"),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                int convertedAmount =
                                int.parse(amountController.text);
                                final expenseModel = ExpenseModel(
                                  amount: convertedAmount,
                                  item: itemController.text,
                                  isIncome:
                                  currentOption == "income" ? true : false,
                                  date: pickDate!,
                                );

                                items.add(expenseModel);
                                if (expenseModel.isIncome) {
                                  income += expenseModel.amount;
                                  deposit += expenseModel.amount;
                                } else {
                                  spentMoney += expenseModel.amount;
                                  deposit -= expenseModel.amount;
                                }

                                setState(() {});
                                Navigator.pop(context);
                                itemController.clear();
                                amountController.clear();
                                datetController.clear();
                              },
                              child: const Text(
                                "ADD",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "CANCEL",
                                style: TextStyle(color: Colors.blue),
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
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: FundCondition(
                      amount: "$deposit",
                      icon: "assets/images/cash.jpg",
                      type: "DEPOSIT",
                    ),
                  ),
                  SizedBox(
                    height: media * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: FundCondition(
                      amount: "$spentMoney",
                      icon: "assets/images/expense.png",
                      type: "EXPENSE",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: FundCondition(
                      amount: "$income",
                      icon: "assets/images/income.jpg",
                      type: "INCOME",
                    ),
                  ),
                ],
              ),
              SizedBox(height: media * 0.1),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: ValueKey(index),
                      startActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                        "Confirm to delete the item?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          ExpenseModel expenseModel =
                                          items[index];
                                          if (expenseModel.isIncome) {
                                            income -= expenseModel.amount;
                                            deposit -= expenseModel.amount;
                                          } else {
                                            spentMoney -= expenseModel.amount;
                                            deposit += expenseModel.amount;
                                          }

                                          setState(() {
                                            items.removeAt(index);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: const Text("DELETE"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("CANCEL"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Item(expenseModel: items[index]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

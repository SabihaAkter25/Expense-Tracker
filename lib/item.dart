import 'package:expence_tracker/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Item extends StatelessWidget {
  final ExpenseModel expenseModel;

  const Item({super.key, required this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        decoration: const BoxDecoration(
            color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(12),
          )
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                  width: 45,
                  child: Image.asset("assets/images/income.jpg",
                    height: 40,
                  width: 40,),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expenseModel.item,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
                Text(
                  DateFormat.yMMMd().format(expenseModel.date),
                style: TextStyle(color: Colors.blueGrey),),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("\$${expenseModel.amount}",
              style: TextStyle(
                fontSize: 23,
                color:expenseModel.isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class ExpenseModel{
  final String item;
  final int amount;
  final DateTime date;
  final bool isIncome;
  ExpenseModel(   {required this.amount,required this.item,required this.isIncome,required this.date,});
}
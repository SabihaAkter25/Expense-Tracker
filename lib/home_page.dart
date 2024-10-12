import 'package:flutter/material.dart';

import 'fund_condition_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final itemController = TextEditingController();
  final amountController = TextEditingController();
  final datetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context).height*1;

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context,
                builder:(context){
                  return SizedBox(
                    height: 400,
                  child: AlertDialog(
                    title: const Text("Add Transaction"),
                    actions: [
                      TextButton(
                          onPressed: (){},
                          child: const Text("ADD",style: TextStyle(color: Colors.blue),)),
                      TextButton(onPressed: (){},
                          child: const Text("CANCEL",style: TextStyle(color: Colors.blue),)),
                    ],
                    content: SizedBox(
                      height: 400,
                      width: 350,
                      child: Column(
                        children: [
                          TextField(
                            controller:itemController,
                            decoration: const InputDecoration(
                              hintText: "Enter the Item",
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: media*0.01,),
                          TextField(
                            controller: amountController,
                            decoration: const InputDecoration(
                              hintText: "Enter the Amount",
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: media*0.01,),
                          TextField(
                            controller: datetController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              hintText: "Enter the Date",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  );
                }

            );
          },
          child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
               Padding(padding: const EdgeInsets.all(8),
                 child: FundCondition(
                   amount:"0",
                   icon:"assets/images/cash.jpg",
                   type:"DEPOSIT",
                 ),
                 ),
                SizedBox(height: media*0.1,),

                Padding(padding: EdgeInsets.all(8),
                  child: FundCondition(
                    amount:"0",
                    icon:"assets/images/cash.jpg",
                    type:"INCOME",
                  ),
                ),
                Padding(padding: EdgeInsets.all(8),
                  child: FundCondition(
                    amount:"0",
                    icon:"assets/images/cash.jpg",
                    type:"INCOME",
                  ),
                ),

              ],
            ),
                      SizedBox(height: media*0.1,),
                      Expanded(
                        child: Container(),
                      )

                    ],
                  ),
          )),
    );
  }
}

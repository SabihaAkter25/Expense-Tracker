import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context, 
                builder:(context){
                  return SizedBox(height: 400,);
                }
            );
          },
          child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [

            ],
          )

        ],
      )),
    );
  }
}

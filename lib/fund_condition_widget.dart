import 'package:flutter/material.dart';

class FundCondition extends StatelessWidget {

 final String type;
 final String amount;
 final String icon;

   FundCondition({super.key,
    required this.type,
    required this.amount,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context).height*1;

    return  Container(
      width:media*0.11,
      padding:EdgeInsets.all(9) ,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius:2.4,
            color: Colors.blueGrey,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        )
      ),
      child: Row(
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: Image.asset(icon),
          ),
          const SizedBox(width: 13,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                  type,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

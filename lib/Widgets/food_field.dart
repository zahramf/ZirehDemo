import 'package:flutter/material.dart';

class FoodField extends StatelessWidget {
  final String foodName;
  final String status;
  final Color sNameColor;
  final Color sBoxolor;

  const FoodField(
      {Key? key,
      required this.foodName,
      required this.status,
      required this.sNameColor,
      required this.sBoxolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              this.foodName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              //color: Colors.green[100],
              decoration: BoxDecoration(
                color: this.sBoxolor,
                //Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                this.status,
                style: TextStyle(
                    color: this.sNameColor, fontWeight: FontWeight.bold
                    //Colors.green[300],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

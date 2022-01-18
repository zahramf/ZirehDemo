import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zireh_demo/Model/transaction.dart';
import 'package:zireh_demo/UI/create_food.dart';
import 'package:zireh_demo/Widgets/food_field.dart';
import 'package:zireh_demo/boxes.dart';

class SuggestedFood extends StatefulWidget {
  const SuggestedFood({Key? key}) : super(key: key);

  @override
  _SuggestedFoodState createState() => _SuggestedFoodState();
}

class _SuggestedFoodState extends State<SuggestedFood> {
  // String foodName = '';

  @override
  void dispose() {
    Hive.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: SizedBox(
            height: 30,
            child: Image.asset('assets/images/xfQEszMA.png'),
          ),
        ),
      ),
      backgroundColor: Color(0xffF5F8FE),
      body: ValueListenableBuilder<Box<Transaction>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context, box, _) {
          final transactions = box.values.toList().cast<Transaction>();
          return buildContent(transactions);
        },
      ),
    );
  }

  Widget buildContent(List<Transaction> transactions) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              'لیست غذاهای ثبت شده',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: GestureDetector(
                onTap: () {
                  // _awaitReturnValueFromSecondScreen(context);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CreateFood(),
                    ),
                  );
                },
                child: Align(
                  child: Container(
                    height: 50,

                    width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      // color: Colors.cyan[500],
                      border: Border.all(
                        color: Color(0xffC4134C),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "افزودن غذای جدید",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xffC4134C),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FoodField(
              foodName: 'بستنی',
              status: 'تایید شده',
              sNameColor: Color(0xff5DCFB9),
              sBoxolor: Color(0xffE8F8F5),
            ),
            FoodField(
              foodName: 'نان تست',
              status: 'تایید نشده',
              sNameColor: Color(0xffF28A9C),
              sBoxolor: Color(0xffFDEDF0),
            ),
            FoodField(
              foodName: 'سیب زمینی سرخ کرده',
              status: 'در حال بررسی',
              sNameColor: Color(0xffFFCE41),
              sBoxolor: Color(0xffFFF9E7),
            ),
            FoodField(
              foodName: 'گردو',
              status: 'تایید شده',
              sNameColor: Color(0xff5DCFB9),
              sBoxolor: Color(0xffE8F8F5),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = transactions[index];

                return FoodField(
                  foodName: transaction.foodName.toString(),
                  status: 'در حال بررسی',
                  sNameColor: Color(0xffFFCE41),
                  sBoxolor: Color(0xffFFF9E7),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

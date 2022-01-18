import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zireh_demo/Model/transaction.dart';
import 'package:zireh_demo/UI/suggested_food.dart';
import 'package:zireh_demo/Widgets/drop_down_field.dart';
import 'package:zireh_demo/Widgets/switch_btton.dart';
import 'package:zireh_demo/Widgets/text_field.dart';
import 'package:zireh_demo/boxes.dart';

class CreateFood extends StatefulWidget {
  const CreateFood({Key? key}) : super(key: key);

  @override
  _CreateFoodState createState() => _CreateFoodState();
}

class _CreateFoodState extends State<CreateFood> {
  TextEditingController textFieldController = TextEditingController();

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
        leading: GestureDetector(
          onTap: () async {
            await Hive.openBox<Transaction>('transactions');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SuggestedFood(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffC4134C),
            size: 32,
          ),
        ),
      ),
      backgroundColor: Color(0xffF5F8FE),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'ثبت غذای جدید',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // ignore: unnecessary_null_comparison
                  child: Image.asset('assets/images/food.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Text(
                        'تصویر غذا',
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'تغییر تصویر',
                          style: TextStyle(
                            color: Color(0xffC4134C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DropDownField(
              title: 'دسته بندی',
              items: ['رژیمی', 'فیبر دار', 'پر پروتئین'],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    // width: size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F8FE),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      controller: textFieldController,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      // controller: titleCobtroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // labelText: " عنوان غذا را وارد کنید",
                      ),
                    ),
                  ),
                  Positioned(
                    top: -9,
                    left: 30.0,
                    right: 10.0,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            decoration: new BoxDecoration(
                              color:
                                  // Colors.red
                                  Color(0xffF5F8FE),
                            ),
                            child: Text(
                              'عنوان',
                              // this.title,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextFields(title: 'توضیحات یا دستور پخت'),
            DropDownField(
                title: 'مناسب برای وعده',
                items: ['صبحانه', 'ناهار', 'شام', 'میان وعده']),
            SwitchButton(yText: 'بله', nText: 'خیر'),
            DropDownField(
                title: 'استان', items: ['تهران', 'کاشان', 'شیراز', 'زنجان']),
            GestureDetector(
              onTap: () {
                addTransaction(textFieldController.text);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SuggestedFood(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Align(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.sslymmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Color(0xffC4134C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "تایید و ادامه",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addTransaction(String foodName) async {
    await Hive.openBox<Transaction>('transactions');
    final transaction = Transaction()..foodName = foodName;

    final box = Boxes.getTransactions();
    box.add(transaction);
  }
}

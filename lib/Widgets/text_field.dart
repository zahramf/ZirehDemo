import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String title;

  const TextFields({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 12),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12),
          //     border: Border.all(color: Colors.grey),
          //   ),

          // ),
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
                      this.title,
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
    );
    ;
  }
}

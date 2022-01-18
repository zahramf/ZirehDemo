import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  final String title;
  List<String> items;
  DropDownField({Key? key, required this.title, required this.items})
      : super(key: key);
  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: value,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xffC4134C),
                ),
                items: widget.items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() => this.value = value),
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
                      widget.title,
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
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      );
}

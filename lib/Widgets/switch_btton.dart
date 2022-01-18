import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final String yText;
  final String nText;

  const SwitchButton({Key? key, required this.yText, required this.nText})
      : super(key: key);
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("این غذا محلی است؟"),
          buildHeader(
            nText: widget.nText,
            yText: widget.yText,
            child: buildSwitch(),
          ),
        ],
      ),
    );
  }

  Widget buildHeader({
    required Widget child,
    required String yText,
    required String nText,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            nText,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: child,
          ),
          Text(
            yText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xffC4134C),
            ),
          ),
        ],
      );

  Widget buildSwitch() => Transform.scale(
        scale: 1.6,
        child: Switch.adaptive(
          // thumbColor: MaterialStateProperty.all(
          //   Color(0xffC4134C),
          // ),
          splashRadius: 10,
          activeColor: Color(0xffC4134C),
          activeTrackColor: Color(0xffE5EBF8),
          // inactiveThumbColor: Colors.orange,
          // inactiveTrackColor: Colors.yellow,
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );
}

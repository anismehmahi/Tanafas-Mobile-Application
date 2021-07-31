import 'package:flutter/material.dart';
import 'package:tnafes/components/text_field_container.dart';

import '../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool state=true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: state,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "كلمة السر",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: InkWell(
            onTap: (){
              print(state);
              setState(() {
                state=!state;

              });
            },
            child: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

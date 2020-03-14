import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key key,
    @required TextEditingController controller,
    @required String hintText,
    @required bool isPassword,
  })  : _controller = controller,
        _hintText = hintText,
        _isPassword = isPassword,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 30.0,
            width: 1.0,
            color: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.only(left: 00.0, right: 10.0),
          ),
          new Expanded(
            child: TextField(
              obscureText: _isPassword,
              onChanged: (value) {
                //Do something with the user input.
              },
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _hintText,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}

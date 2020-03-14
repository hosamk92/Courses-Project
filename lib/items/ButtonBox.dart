import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';

class ButtonBox extends StatelessWidget {
  const ButtonBox(
      {Key key,
      @required this.primaryColor,
      @required Function onPressed,
      @required String text,
      @required this.icon})
      : _onPressed = onPressed,
        _text = text,
        super(key: key);

  final Color primaryColor;
  final Function _onPressed;
  final String _text;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0, right: 15.0, bottom: 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              splashColor: this.primaryColor,
              color: this.primaryColor,
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      _text,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  new Expanded(
                    child: Container(),
                  ),
                  new Transform.translate(
                    offset: Offset(15.0, 0.0),
                    child: new Container(
                      padding: const EdgeInsets.all(1.0),
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(28.0)),
                        splashColor: Colors.white,
                        color: Colors.white,
                        child: icon,
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              onPressed: _onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

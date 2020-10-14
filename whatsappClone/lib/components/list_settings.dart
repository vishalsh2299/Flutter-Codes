import 'package:flutter/material.dart';

class ListSettings extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;

  const ListSettings({Key key, this.icon, this.title, this.content})
      : super(key: key);

  @override
  _ListSettingsState createState() => _ListSettingsState();
}

class _ListSettingsState extends State<ListSettings> {
  TextEditingController _nameController = TextEditingController();

  String profileName = "";

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.title == "Vishal Singh") {
          displaySnackBar();
        }

        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (_) => NavigationName(
        //           title: title,
        //           content: content,
        //         )));
      },
      child: Container(
          padding: EdgeInsets.only(left: 25),
          height: 50,
          child: Row(
            children: [
              Icon(widget.icon,
                  size: 25, color: Color.fromRGBO(76, 175, 150, 1)),
              SizedBox(
                width: 25,
              ),
              widget.content.length == 0
                  ? Text(widget.title,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ))
                  : RichText(
                      text: TextSpan(children: [
                      TextSpan(
                          text: profileName.length == 0
                              ? "${widget.title}\n"
                              : "${profileName}\n",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: widget.content,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.4,
                            color: Colors.black54,
                          ))
                    ])),
            ],
          )),
    );
  }

  void displaySnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
          duration: Duration(days: 1),
          backgroundColor: Color.fromRGBO(56, 140, 100, 1),
          content: Wrap(
            children: [
              TextField(
                maxLength: 20,
                controller: _nameController,
                decoration: InputDecoration(
                    hintText:
                        profileName.length == 0 ? widget.title : profileName,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                  FlatButton(
                      onPressed: () {
                        if (_nameController.text.length <= 20) {
                          setState(() {
                            profileName = _nameController.text;
                          });
                          Scaffold.of(context).hideCurrentSnackBar();
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ))
                ],
              )
            ],
          )),
    );
  }
}

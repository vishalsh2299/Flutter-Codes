import 'dart:io';

import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsappClone/screens/home_screen.dart';

class InitialProfilePage extends StatefulWidget {
  @override
  _InitialProfilePageState createState() => _InitialProfilePageState();
}

class _InitialProfilePageState extends State<InitialProfilePage> {
  TextEditingController _nameController = TextEditingController();
  bool isShowSticker = false;
  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
        // padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "Profile Info",
              style: TextStyle(
                  color: Color.fromRGBO(56, 150, 150, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please Provide your name and optional profile photo",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey[50],
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Image.asset("assets/profile_default.png"),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _rowWidget(),
            isShowSticker ? Expanded(child: buildSticker()) : Container(),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => MaterialButton(
                        color: Color.fromRGBO(76, 200, 80, 1),
                        onPressed: () {
                          if (_nameController.text.isEmpty) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Enter your name ...')));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => HomeScreen()));
                          }
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget buildSticker() {
    return ListView(
        padding: const EdgeInsets.only(top: 10.0, left: 30, right: 10),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: EmojiPicker(
              rows: 4,
              columns: 7,
              buttonMode: ButtonMode.MATERIAL,
              onEmojiSelected: (emoji, category) {
                //print(emoji.emoji);
                _nameController.text += emoji.emoji;
              },
            ),
          ),
        ]);
  }

  Widget _rowWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  _showPicker(context);
                }),
            decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: "Enter your name"),
          )),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: IconButton(
                icon: Icon(Icons.insert_emoticon),
                onPressed: () => {
                      this.setState(() {
                        isShowSticker = isShowSticker ? false : true;
                      })
                    }),
          )
        ],
      ),
    );
  }
}

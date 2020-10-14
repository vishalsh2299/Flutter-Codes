import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsappClone/components/list_settings.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  bool isProfileImage = false;

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
                  new ListTile(
                    leading: new Icon(Icons.delete),
                    title: new Text('Remove photo'),
                    onTap: () {
                      setState(() {
                        _image = null;
                      });

                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Color.fromRGBO(56, 140, 100, 1),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 150,
                  child: Stack(children: [
                    Positioned(
                      top: 20,
                      left: MediaQuery.of(context).size.width / 3,
                      child: GestureDetector(
                        onTap: () {
                          if (_image != null) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return DetailScreen(
                                image: _image,
                              );
                            }));
                          }
                        },
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.grey[50],
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _image,
                                    width: 200,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 200,
                                  height: 200,
                                  child:
                                      Image.asset("assets/profile_default.png"),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 95,
                      left: MediaQuery.of(context).size.width / 2,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromRGBO(56, 140, 100, 1),
                        child: IconButton(
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              _showPicker(context);
                            }),
                      ),
                    )
                  ])),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                height: 80,
                child: ListSettings(
                  icon: Icons.person,
                  title: "Vishal Singh",
                  content:
                      "This is not your username or pin. This name\n will be visible to your WhatsApp contacts",
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ListSettings(
                  icon: Icons.help_outline,
                  title: "About",
                  content: "Not Available",
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ListSettings(
                  icon: Icons.phone,
                  title: "Phone",
                  content: "+91 8423230932",
                ),
              )
            ],
          ),
        ));
  }
}

class DetailScreen extends StatelessWidget {
  final File image;

  const DetailScreen({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'profilePic',
            child: Image.file(
              image,
              width: 200,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

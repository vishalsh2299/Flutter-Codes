import 'package:flutter/material.dart';
import 'package:whatsappClone/components/list_settings.dart';
import 'package:whatsappClone/pages/profile_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color.fromRGBO(56, 140, 100, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ProfilePage()));
            },
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/profile_default.png",
                    height: 50,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Vishal Singh\n",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: "Can't talk, WhatsApp only",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.4,
                          color: Colors.black54,
                        ))
                  ])),
                ],
              ),
            ),
          ),
          Divider(
            height: 2,
          ),
          ListSettings(
            icon: Icons.person,
            title: "Account",
            content: "Privacy, security, change number",
          ),
          ListSettings(
            icon: Icons.chat,
            title: "Chats",
            content: "Theme, wallpapers, chat history",
          ),
          ListSettings(
            icon: Icons.notifications,
            title: "Notifications",
            content: "Message, group & call tones",
          ),
          ListSettings(
            icon: Icons.data_usage,
            title: "Data and storage usage",
            content: "Privacy, security, change number",
          ),
          ListSettings(
            icon: Icons.help_outline,
            title: "Help",
            content: "FAQ, contact us, privacy policy",
          ),
          ListSettings(
            icon: Icons.supervisor_account,
            title: "Invite a friend",
            content: "",
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "from\n",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    )),
                TextSpan(
                    text: "FACEBOOK",
                    style: TextStyle(
                        fontSize: 17,
                        height: 1.5,
                        letterSpacing: 3,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ])),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

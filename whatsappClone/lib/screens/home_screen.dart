import 'package:flutter/material.dart';
import 'package:whatsappClone/components/custom_tab_bar.dart';
import 'package:whatsappClone/pages/calls_page.dart';
import 'package:whatsappClone/pages/camera_page.dart';
import 'package:whatsappClone/pages/chat_page.dart';
import 'package:whatsappClone/pages/settings_page.dart';
import 'package:whatsappClone/pages/status_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  int _currentPageIndex = 1;
  PageController _pageViewController = PageController(initialPage: 1);
  List<Widget> _pages = [CameraPage(), ChatPage(), StatusPage(), CallsPage()];

  _buildSearch() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 50,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0),
            spreadRadius: 1,
            offset: Offset(0.0, 0.50))
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search...",
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(76, 175, 80, 1), width: 2)),
            prefixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _isSearch = false;
                  });
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(76, 175, 80, 1),
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex == 0
          ? null
          : AppBar(
              elevation: 0.0,
              backgroundColor: _isSearch
                  ? Colors.transparent
                  : Color.fromRGBO(56, 140, 100, 1),
              automaticallyImplyLeading: false, // back arrow
              title: _isSearch
                  ? Container(
                      height: 0.0,
                      width: 0.0,
                    )
                  : Text("WhatsApp"),
              flexibleSpace: _isSearch
                  ? _buildSearch()
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    ),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _isSearch = true;
                      });
                    }),
                SizedBox(
                  width: 5,
                ),
                PopupMenuButton(
                    onSelected: (value) {
                      openMenuFiles(value);
                    },
                    itemBuilder: (_) => _showPopupMenu())
              ],
            ),
      body: Column(
        children: [
          _currentPageIndex == 0
              ? Container(
                  height: 0,
                  width: 0,
                )
              : _isSearch
                  ? Container()
                  : CustomTabBar(index: _currentPageIndex),
          Expanded(
              child: PageView.builder(
            itemBuilder: (_, index) {
              return _pages[index];
            },
            itemCount: _pages.length,
            controller: _pageViewController,
            //           itemBuilder: (context, index) {
            //   return GestureDetector(
            //     onTap: () {
            //       _pageController.jumpToPage(index); // for regular jump
            //       _pageController.animateToPage(_position, curve: Curves.decelerate, duration: Duration(milliseconds: 300)); // for animated jump. Requires a curve and a duration
            //     },
            //     child: Container();
            //   );
            // }
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
          ))
        ],
      ),
    );
  }

  List<PopupMenuItem<String>> _showPopupMenu() {
    switch (_currentPageIndex) {
      case 1:
        return [
          PopupMenuItem<String>(
              child: const Text('New group'), value: 'New group'),
          PopupMenuItem<String>(
              child: const Text('New broadcast'), value: 'New broadcast'),
          PopupMenuItem<String>(
              child: const Text('WhatsApp Web'), value: 'WhatsApp Web'),
          PopupMenuItem<String>(
              child: const Text('Starred messages'), value: 'Starred messages'),
          PopupMenuItem<String>(
              child: const Text('Settings'), value: 'Settings'),
        ];
        break;
      case 2:
        return [
          PopupMenuItem<String>(
              child: const Text('Status privacy'), value: 'Status privacy'),
          PopupMenuItem<String>(
              child: const Text('Settings'), value: 'Settings'),
        ];
        break;
      case 3:
        return [
          PopupMenuItem<String>(
              child: const Text('Clear call log'), value: 'Clear call log'),
          PopupMenuItem<String>(
              child: const Text('Settings'), value: 'Settings'),
        ];
        break;
    }
    return null;
  }

  void openMenuFiles(value) {
    switch (value) {
      case "Settings":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SettingsPage()));
        break;
    }
  }
}

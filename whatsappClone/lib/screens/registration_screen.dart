import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappClone/components/phone_verification.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Country _selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');
  String _countryCode = "+91";

  TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 8, bottom: 40),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Verify your phone number",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(56, 150, 150, 1),
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black54,
                    ),
                    onPressed: () {})
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 30, left: 5), // r-8 l-25
              child: Text(
                "WhatsApp will send an SMS message (carrier charges may apply) to verify, your phone number. Enter your country code and phone number: ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: _openCountryPickerDialog,
              title: _buildDialogItem(_selectedCountry),
            ),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.50,
                                color: Color.fromRGBO(76, 175, 80, 1)))),
                    width: 80,
                    height: 42,
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("+",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          Text(
                            "${_selectedCountry.phoneCode}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextFormField(
                        controller: _numberController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        decoration: InputDecoration(hintText: "Phone Number"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => MaterialButton(
                        color: Color.fromRGBO(76, 200, 80, 1),
                        onPressed: () {
                          if (_numberController.text.length == 10) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PhoneVerification()));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Enter 10 digit number')));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  void _openCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (_) => Theme(
            data: Theme.of(context)
                .copyWith(primaryColor: Color.fromRGBO(76, 175, 80, 1)),
            child: CountryPickerDialog(
              titlePadding: EdgeInsets.all(8.0),
              searchCursorColor: Colors.black,
              searchInputDecoration: InputDecoration(hintText: "Search"),
              isSearchable: true,
              title: Text("Select your phone code"),
              onValuePicked: (Country country) {
                _selectedCountry = country;
                setState(() {
                  _countryCode = country.phoneCode;
                });
              },
              itemBuilder: _buildDialogItem,
            )));
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromRGBO(76, 175, 80, 1), width: 1.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CountryPickerUtils.getDefaultFlagImage(country),
          // SizedBox(
          //   height: 8.0,
          //   width: 8.0,
          // ),
          // Text(
          //   "+${country.phoneCode}",
          // ),
          // SizedBox(
          //   height: 8.0,
          //   width: 8.0,
          // ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            width: 200,
            child: Text(
              "${country.name}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_drop_down),
          )
        ],
      ),
    );
  }
}

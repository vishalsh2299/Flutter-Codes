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
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(""),
                Text(
                  "Verify your phone number",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(76, 175, 80, 1),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "WhatsApp Clone will send SMS to your phone number. Enter your country code and phone number: ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: _openCountryPickerDialog,
              title: _buildDialogItem(_selectedCountry),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.50,
                              color: Color.fromRGBO(76, 175, 80, 1)))),
                  width: 80,
                  height: 42,
                  alignment: Alignment.center,
                  child: Text("+${_selectedCountry.phoneCode}"),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
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
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => MaterialButton(
                        color: Color.fromRGBO(76, 175, 80, 1),
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
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 18, color: Colors.white),
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
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color.fromRGBO(76, 175, 80, 1), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            height: 8.0,
            width: 8.0,
          ),
          Text(
            "+${country.phoneCode}",
          ),
          SizedBox(
            height: 8.0,
            width: 8.0,
          ),
          Container(
            width: 100,
            child: Text(
              "${country.name}",
              overflow: TextOverflow.fade,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}

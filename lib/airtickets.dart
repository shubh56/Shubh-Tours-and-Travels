import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter/counter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'constants.dart';
import 'topappbar.dart';
import 'package:country_code_picker/country_code_picker.dart';


class AirTickets extends StatefulWidget {
  const AirTickets({super.key});

  @override
  State<AirTickets> createState() => _AirTicketsState();
}

class _AirTicketsState extends State<AirTickets> {
  bool hasbeenpressed = false;
  int index = 1;
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  String countryCode ="+91";
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(
      const Duration(days: 2),
    ),
  );
  DateTime date = DateTime.now();
  String selectedDate = 'Click Here';
  Map<String,String> request = {
    'mode': 'One way',
  };
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
        child: const TopAppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                      hasbeenpressed ? Colors.grey : kFontGoldColor),
                ),
                onPressed: () {
                  setState(() {
                    hasbeenpressed = !hasbeenpressed;
                    index = 1;
                    request["mode"]='One Way';
                  });
                },
                child: Text(
                  'One Way',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                      hasbeenpressed ? kFontGoldColor : Colors.grey),
                ),
                onPressed: () {
                  setState(() {
                    hasbeenpressed = !hasbeenpressed;
                    index = 2;
                    request["mode"] = 'Round Trip';
                  });
                },
                child: Text(
                  'Round trip',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: mediaQuery.size.width * 0.7,
            child: TextField(
              controller: from,
              cursorColor: kFontGoldColor,
              style: const TextStyle(
                color: kFontGoldColor,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kFontGoldColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kFontGoldColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'From',
                hintStyle: const TextStyle(
                  color: kFontGoldColor,
                ),
                icon: const Icon(Icons.location_on),
                iconColor: kFontGoldColor,
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),
          SizedBox(
            width: mediaQuery.size.width * 0.7,
            child: TextField(
              controller: to,
              cursorColor: kFontGoldColor,
              style: const TextStyle(
                color: kFontGoldColor,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kFontGoldColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kFontGoldColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'To',
                hintStyle: const TextStyle(
                  color: kFontGoldColor,
                ),
                icon: const Icon(Icons.location_on),
                iconColor: kFontGoldColor,
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: kFontGoldColor,
                height: mediaQuery.size.height * 0.06,
                child: CountryCodePicker(
                  initialSelection: 'IN',
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value){
                    countryCode=value.toString();
                  },
                ),
              ),
              SizedBox(
                width: mediaQuery.size.width * 0.03,
              ),
              SizedBox(
                width: mediaQuery.size.width * 0.5,
                child: TextField(
                  controller: contactNumber,
                  cursorColor: kFontGoldColor,
                  style: const TextStyle(
                    color: kFontGoldColor,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kFontGoldColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kFontGoldColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Contact number',
                    hintStyle: const TextStyle(
                      color: kFontGoldColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.size.width * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Dates',
                style: TextStyle(
                  color: kFontGoldColor,
                  fontFamily: 'MPIDeco',
                  fontSize: mediaQuery.size.height * 0.03,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (index == 2) {
                    DateTimeRange? newDateRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (newDateRange == null) return;
                    setState(() {
                      dateRange = newDateRange;
                      selectedDate =
                          "${start.day}/${start.month}/${start.year}-${end.day}/${end.month}/${end.year}";
                    });
                  } else {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (newDate == null) return;
                    setState(() {
                      date = newDate;
                      selectedDate = "${date.day}/${date.month}/${date.year}";
                    });
                  }
                  request['selectedDate'] = selectedDate.toString();
                },
                child: Text(
                  selectedDate,
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Adults',
                    style: TextStyle(
                        color: kFontGoldColor,
                        fontSize: mediaQuery.size.width * 0.035),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.03),
                  Container(
                    color: Colors.white,
                    child: Counter(
                      min: 0,
                      max: 9,
                      initial: 1,
                      onValueChanged: (value) {
                        request["Adult"] = value.toString();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: mediaQuery.size.width * 0.03),
              Row(
                children: [
                  Text(
                    'Child',
                    style: TextStyle(
                        color: kFontGoldColor,
                        fontSize: mediaQuery.size.width * 0.035),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.03),
                  Container(
                    color: Colors.white,
                    child: Counter(
                      min: 0,
                      max: 9,
                      initial: 0,
                      onValueChanged: (value) {
                        request["Child"] = value.toString();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),
          SizedBox(
              width: mediaQuery.size.width * 0.7,
              child: TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: () {
                  final String startLocation = from.text.toString();
                  final String stopLocation = to.text.toString();
                  final String contact = contactNumber.text.toString();
                  request["From"] = startLocation;
                  request["To"] = stopLocation;
                  request["Contact"]=countryCode+contact;
                  FirebaseFirestore db = FirebaseFirestore.instance;
                  FirebaseAuth auth = FirebaseAuth.instance;
                  final String? userEmail=auth.currentUser?.email.toString();
                  request["Email"]= userEmail!;
                  DateTime uniqueId = DateTime.timestamp();
                  String docName = '$userEmail $uniqueId';
                  db.collection('AirRequest').doc(docName).set(request);
                },
                child: const Text(
                  'Submit Request',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

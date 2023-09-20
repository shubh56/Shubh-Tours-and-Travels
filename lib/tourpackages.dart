import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'topappbar.dart';
import 'package:counter/counter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:country_code_picker/country_code_picker.dart';

class TourPackages extends StatefulWidget {
  const TourPackages({super.key});

  @override
  State<TourPackages> createState() => _TourPackagesState();
}

class _TourPackagesState extends State<TourPackages> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(
      const Duration(days: 2),
    ),
  );
  TextEditingController destination = TextEditingController();
  Map<String,String> request={
    "Children":'0',
    "Rating":'2',
  };
  String selectedDate = 'Click Here';
  String countryCode = '91';
  TextEditingController contactNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final start =  dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
        child: const TopAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: mediaQuery.size.height * 0.1,
          ),
          child: Column(
            children: [
              Hero(
                tag: 'tourHero',
                child: Material(
                  color: kBackGroundMaroonColor,
                  child: Text(
                    'Tour Packages',
                    style: TextStyle(
                      fontFamily: 'Northwell',
                      fontSize: mediaQuery.size.height*0.05,
                      color: kFontGoldColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: mediaQuery.size.height*0.03,
              ),
              SizedBox(
                width: mediaQuery.size.width * 0.7,
                child: TextField(
                  controller: destination,
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
                    hintText: 'Destination',
                    hintStyle: const TextStyle(
                      color: kFontGoldColor,
                    ),
                    icon: const Icon(Icons.airplanemode_on),
                    iconColor: kFontGoldColor,
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.03,
                width: mediaQuery.size.width * 0.04,
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.04,
                width: mediaQuery.size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Dates',
                      style: TextStyle(
                        color: kFontGoldColor,
                        fontFamily: 'MPIDeco',
                        fontSize: mediaQuery.size.height*0.03,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        DateTimeRange? newDateRange = await
                        showDateRangePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2100),);
                        if(newDateRange==null) return;
                        setState(() {
                          dateRange = newDateRange;
                          selectedDate=  "${start.day}/${start.month}/${start.year}-${end.day}/${end.month}/${end.year}";
                        });
                        request['selectedDate']=selectedDate;
                      },
                      child: Text(
                        '${start.day}/${start.month}/${start.year}-${end.day}/${end.month}/${end.year}',
                        style: TextStyle(
                          color: kFontGoldColor,
                          fontSize: mediaQuery.size.height*0.02,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rating',
                    style: TextStyle(
                      fontFamily: 'MPIDeco',
                      fontSize: mediaQuery.size.height*0.02,
                      color: kFontGoldColor,
                    ),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.03),
                  RatingBar.builder(
                    initialRating: 2,
                    minRating: 2,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      request["Rating"]=rating.toString();
                    },
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
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
              SizedBox(height: mediaQuery.size.height * 0.03),
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
                            request["Children"] = value.toString();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
              SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    onPressed: () {
                      // request["Destination"]= destination.text.toString();;
                      // request["ContactNumber"]='$countryCode ${contactNumber.text.toString()}';
                      // FirebaseFirestore db = FirebaseFirestore.instance;
                      // FirebaseAuth auth = FirebaseAuth.instance;
                      // final String? userEmail=auth.currentUser?.email.toString();
                      // request["Email"]= userEmail!;
                      // DateTime uniqueId = DateTime.timestamp();
                      // String docName = '$userEmail $uniqueId';
                      // db.collection('TourRequest').doc(docName).set(request);
                      Navigator.pushNamed(context,'recommendPackage',arguments: <String,String>{
                        'destination': destination.text.toString(),
                      } );
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
        ),
      ),
    );
  }
}

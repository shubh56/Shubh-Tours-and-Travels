import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';

class RequestHotel extends StatefulWidget {
  const RequestHotel({super.key});

  @override
  State<RequestHotel> createState() => _RequestHotelState();
}

class _RequestHotelState extends State<RequestHotel> {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('HotelRequest');
  List dataFromDB = [];

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await collectionRef.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    dataFromDB = allData;
    print('In getData method ${dataFromDB.length} $dataFromDB');
  }

  @override
  void initState() {
    super.initState();
    getData(); // Start fetching data when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: AppBar(
        backgroundColor: kBackGroundMaroonColor,
        centerTitle: true,
        title: Text(
          'Shubh Tours and Travels',
          style: TextStyle(
              color: kFontGoldColor,
              fontFamily: 'Northwell',
              fontSize: mediaQuery.size.width * 0.06),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: mediaQuery.size.height*0.04),
            child: Text(
              'Hotel Request',
              style: TextStyle(
                fontSize: mediaQuery.size.width * 0.04,
                fontFamily: 'MPIDeco',
                color: kFontGoldColor,
              ),
            ),
          ),
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display a circular progress indicator while waiting for data
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // Handle any errors that occur during data retrieval
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                // Data retrieval is complete, display the ListView
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dataFromDB.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        dataFromDB[index]['Email'],
                        style: TextStyle(
                          color: kFontGoldColor,
                          backgroundColor: kBackGroundMaroonColor,
                          fontSize: mediaQuery.size.width * 0.03,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

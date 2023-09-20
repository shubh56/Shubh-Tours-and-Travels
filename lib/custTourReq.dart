import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';

class CustomerTourRequest extends StatefulWidget {
  const CustomerTourRequest({super.key});

  @override
  State<CustomerTourRequest> createState() => _CustomerTourRequestState();
}

class _CustomerTourRequestState extends State<CustomerTourRequest> {
  CollectionReference collectionRef =
  FirebaseFirestore.instance.collection('TourRequest');
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
              'Tour Request',
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
                      title: Row(
                        children: [
                          Text(
                            'For: ${dataFromDB[index]['Destination']}',
                            style: TextStyle(
                              color: kFontGoldColor,
                              backgroundColor: kBackGroundMaroonColor,
                              fontSize: mediaQuery.size.width * 0.03,
                            ),
                          ),

                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Email: ${dataFromDB[index]['Email']}',
                            style: TextStyle(
                              color: kFontGoldColor,
                              backgroundColor: kBackGroundMaroonColor,
                              fontSize: mediaQuery.size.width * 0.025,
                            ),
                          ),
                          Text(
                            '   Contact Number: ${dataFromDB[index]['ContactNumber']}',
                            style: TextStyle(
                              color: kFontGoldColor,
                              backgroundColor: kBackGroundMaroonColor,
                              fontSize: mediaQuery.size.width * 0.025,
                            ),
                          ),
                        ],
                      ),
                      onTap: () => showDialog(context: context, builder: (BuildContext context)=> AlertDialog(
                        insetPadding: EdgeInsets.only(bottom: mediaQuery.size.height*0.4, top: mediaQuery.size.height*0.24),
                        title: Text(
                          'Expanded Information',
                          style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize: mediaQuery.size.width * 0.03,
                          ),
                        ),
                        content: Column(
                          children: [
                            Text(
                              ' Guests: ${dataFromDB[index]['Adult']} Adults and ${dataFromDB[index]['Children']} Children',
                              style: TextStyle(
                                color: kFontGoldColor,
                                backgroundColor: kBackGroundMaroonColor,
                                fontSize: mediaQuery.size.width * 0.03,
                              ),
                            ),
                            Text(
                              '  On: ${dataFromDB[index]['selectedDate']}',
                              style: TextStyle(
                                color: kFontGoldColor,
                                backgroundColor: kBackGroundMaroonColor,
                                fontSize: mediaQuery.size.width * 0.03,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      )),
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

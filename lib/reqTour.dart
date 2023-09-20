import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'constants.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class RequestTour extends StatefulWidget {
  const RequestTour({super.key});
  @override
  State<RequestTour> createState() => _RequestTourState();
}

class _RequestTourState extends State<RequestTour> {
  TextEditingController category = TextEditingController();

  PlatformFile? pickedFile;
  Future<void> pickFile() async{
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      pickedFile = result?.files.first;
    });
  }
  Future<void> uploadFile() async {
    final file = File(pickedFile!.path!);
    final path = '${category.text.toString()}/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
             'Tour Packages Upload',
              style: TextStyle(
                fontFamily: 'MPIDeco',
                fontSize: mediaQuery.size.width*0.05,
                color: kFontGoldColor,
              ),
          ),
          SizedBox(
            width: double.infinity,
            height: mediaQuery.size.height*0.04,
          ),
          SizedBox(
            width: mediaQuery.size.width*0.8,
            child: TextField(
              controller: category,
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
                hintText: 'Category',
                hintStyle: const TextStyle(
                  color: kFontGoldColor,
                ),
                icon: const Icon(Icons.category),
                iconColor: kFontGoldColor,
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height*0.04,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: uploadFile,
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(mediaQuery.size.width*0.02)),
                  foregroundColor: const MaterialStatePropertyAll(kBackGroundMaroonColor),
                  backgroundColor: const MaterialStatePropertyAll(kFontGoldColor),
                ),
                child: Text(
                  'Upload PDF',
                  style: TextStyle(
                    fontSize: mediaQuery.size.width*0.03,
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height*0.04,
                width: mediaQuery.size.width*0.04,
              ),
              ElevatedButton(
                onPressed: pickFile,
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(mediaQuery.size.width*0.02)),
                  foregroundColor: const MaterialStatePropertyAll(kBackGroundMaroonColor),
                  backgroundColor: const MaterialStatePropertyAll(kFontGoldColor),
                ),
                child: Text(
                  'Select PDF',
                  style: TextStyle(
                    fontSize: mediaQuery.size.width*0.03,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

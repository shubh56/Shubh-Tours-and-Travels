import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'topappbar.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendPackage extends StatefulWidget {
  final Map<String, dynamic>? args;
  const RecommendPackage(this.args, {super.key});

  @override
  State<RecommendPackage> createState() => _RecommendPackageState();
}

class _RecommendPackageState extends State<RecommendPackage> {
  var isLoaded = false;
  var resultsFound = true;
  ListResult? results;
  String? dest;

  void listAllFiles() async {
    final storageRef =
        FirebaseStorage.instance.ref().child('/${widget.args?["destination"]}');
    final listResult = await storageRef.listAll();
    results = listResult;
    if (results != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      resultsFound = false;
    }
  }

  @override
  void initState() {
    super.initState();
    listAllFiles();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var destination = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    dest = destination['destination'];
    if (resultsFound == false) {
      return Scaffold(
        backgroundColor: kBackGroundMaroonColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
          child: const TopAppBar(),
        ),
        body: Container(
          child: Text(
            'No results found,\n we will get back to you within 24 hrs',
            style: TextStyle(
              color: kFontGoldColor,
              fontSize: mediaQuery.size.height * 0.04,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'MPIDeco',
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: kBackGroundMaroonColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
          child: const TopAppBar(),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text(
                  'Recommended Packages for',
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.height * 0.02,
                    fontFamily: 'MPIDeco',
                  ),
                ),
                Text(
                  destination["destination"],
                  style: TextStyle(
                      color: kFontGoldColor,
                      fontSize: mediaQuery.size.height * 0.03,
                      fontFamily: 'MPIDeco'),
                ),
              ],
            ),
            Visibility(
              visible: isLoaded,
              replacement: CircularProgressIndicator(),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: results?.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        results!.items[index].fullPath.toString(),
                        style: const TextStyle(
                          color: kFontGoldColor,
                        ),
                      ),
                      onTap: () async{
                          final storageRef = FirebaseStorage.instance.ref().child(results!.items[index].fullPath.toString());
                          final pdfUrl =  await storageRef.getDownloadURL();
                          final Uri uri = Uri.parse(pdfUrl);
                          launchUrl(uri);
                        },
                    );
                  }),
            ),
          ],
        ),
      );
    }
  }
}

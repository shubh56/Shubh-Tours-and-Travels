import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'topappbar.dart';

class RecommendPackage extends StatefulWidget {
  const RecommendPackage({super.key});

  @override
  State<RecommendPackage> createState() => _RecommendPackageState();
}

class _RecommendPackageState extends State<RecommendPackage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final destination = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
        child: const TopAppBar(),
      ),
      body: Column(
        children: [
          Text(
            'Recommended Packages for ${destination.toString()}',
            style: TextStyle(
              color: kFontGoldColor,
              fontSize: mediaQuery.size.height*0.02,
              fontFamily: 'MPIDeco'
            )
          ),
        ],
      ),
    );
  }
}

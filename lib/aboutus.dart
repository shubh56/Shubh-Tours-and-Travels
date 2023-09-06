import 'package:flutter/material.dart';
import 'constants.dart';
import 'topappbar.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
        child: TopAppBar(),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 40.0,
            ),
            child: Text(
              'About Us',
              style: TextStyle(
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.06,
                fontFamily: 'MPIDeco',
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              '''Welcome to Shubh Tours and Travels, your ultimate destination for unforgettable journeys and seamless adventures. Established with a passion for exploration and a commitment to exceptional service, we take pride in curating enriching travel experiences that go beyond the ordinary. Our team of seasoned travel experts works tirelessly to craft personalized itineraries, ensuring that every moment of your trip is filled with joy, discovery, and cherished memories.
              \nAt Shubh Tours and Travels, we believe that traveling is not just about visiting places; it's about creating meaningful connections with the world around us. Whether you seek to immerse yourself in the vibrant cultures of far-off lands, delve into nature's wonders, or simply unwind amidst picturesque landscapes, we have the perfect journey tailored to your desires.
              \nWe strive to be your trusted travel companion, providing transparent and reliable services that cater to your needs, preferences, and budget. With our attention to detail and dedication to customer satisfaction, you can embark on your dream vacation with confidence, knowing that every aspect of your trip is in capable hands.
              \nJoin us as we open the door to extraordinary experiences and guide you on a path to unparalleled exploration. Let's journey together, creating stories that last a lifetime with Shubh Tours and Travels.''',
              style: TextStyle(
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.026,
              ),
            ),
          ),
          Text(
            'The Team',
            style: TextStyle(
              color: kFontGoldColor,
              fontFamily: 'MPIDeco',
              fontSize: mediaQuery.size.width * 0.06,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: kBackGroundMaroonColor,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: mediaQuery.size.width * 0.09,
                        foregroundImage: const AssetImage('images/ShubhProfile.jpeg'),
                      ),
                      Text(
                        'Shubh Harde-CTO',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'serif',
                          fontSize: mediaQuery.size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: kBackGroundMaroonColor,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: mediaQuery.size.width * 0.09,
                        foregroundImage: AssetImage(''),
                        backgroundColor: Colors.black,
                        child: Text(
                          'RH',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Rachana Harde-CFO',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'serif',
                          fontSize: mediaQuery.size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: kBackGroundMaroonColor,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: mediaQuery.size.width * 0.09,
                        foregroundImage: AssetImage(''),
                        backgroundColor: Colors.black,
                        child: Text(
                          'KH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Text(
                        'Kamesh Harde-CEO',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'serif',
                          fontSize: mediaQuery.size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

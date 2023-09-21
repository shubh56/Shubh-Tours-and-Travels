
import 'package:flutter/material.dart';
import 'constants.dart';
import 'destinationCard.dart';
import 'topappbar.dart';
import 'auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int index = 0;
  int buttonIndex=0;
  void getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email=pref.getString('email').toString();
    print(email);
    if(email.isNotEmpty)
      {index=0;}
    else{index=1;}

  }

  void removeUserPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("email");
  }

    @override
    void initState(){
      getCurrentUser();
    }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackGroundMaroonColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
          child: TopAppBar(),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 320.0,
                child: Container(
                  color: kBackGroundMaroonColor,
                  child: DrawerHeader(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/LogoForApp.png',
                          height: 200.0,
                          width: 190.0,
                        ),
                        Text(
                          'Shubh Tours and Travels',
                          style: TextStyle(
                            fontSize: mediaQuery.size.width * 0.05,
                            color: kFontGoldColor,
                            fontFamily: 'Northwell',
                          ),
                        ),
                        Text(
                          'CELEBRATE THE JOURNEY',
                          style: TextStyle(
                            fontSize: mediaQuery.size.width * 0.03,
                            color: kFontGoldColor,
                            fontFamily: 'MPIDeco',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.airplanemode_active_sharp),
                text: 'Plan a trip',
                nextPage: 'allthree',
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.account_circle),
                text: 'View Profile',
                nextPage: '',
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.question_mark),
                text: 'About Us',
                nextPage: 'aboutus',
              ),
              Visibility(
                visible: buttonIndex == 0 ? true : false,
                child: ListTile(
                  title: TextButton(
                    onPressed: () {
                      setState(() {
                        Auth().signOut();
                        buttonIndex = 1;
                        removeUserPreference();
                      });
                    },
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: mediaQuery.size.height * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: buttonIndex == 1 ? true : false,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'signin');
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: mediaQuery.size.height * 0.02,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: mediaQuery.size.height * 0.04,
                ),
                width: mediaQuery.size.height * 0.6,
                height: mediaQuery.size.height * 0.04,
                color: kBackGroundMaroonColor,
                child: Center(
                  child: SizedBox(
                    height: mediaQuery.size.height * 0.2,
                    width: mediaQuery.size.width * 0.9,
                    child: TextField(
                      cursorColor: kFontGoldColor,
                      style: const TextStyle(
                        color: kFontGoldColor,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kFontGoldColor,
                          ),
                          borderRadius: BorderRadius.circular(
                              mediaQuery.size.height * 0.01),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kFontGoldColor,
                          ),
                          borderRadius: BorderRadius.circular(
                              mediaQuery.size.height * 0.01),
                        ),
                        hintText: 'Destination',
                        hintStyle: const TextStyle(
                          color: kFontGoldColor,
                        ),
                        icon: const Icon(Icons.search),
                        iconColor: kFontGoldColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: mediaQuery.size.height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(kBackGroundMaroonColor),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'tourpacks');
                        },
                        child: Text(
                          'Tour packages',
                          style: TextStyle(
                            fontFamily: 'MPIDeco',
                            color: kFontGoldColor,
                            fontSize: mediaQuery.size.width * 0.045,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(kBackGroundMaroonColor),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'hotels');
                        },
                        child: Text(
                          'Hotels',
                          style: TextStyle(
                            fontFamily: 'MPIDeco',
                            fontSize: mediaQuery.size.width * 0.045,
                            color: kFontGoldColor,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(kBackGroundMaroonColor),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'airtickets');
                        },
                        child: Text(
                          'Air tickets',
                          style: TextStyle(
                            fontSize: mediaQuery.size.width * 0.045,
                            fontFamily: 'MPIDeco',
                            color: kFontGoldColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'Popular Destinations',
                  style: TextStyle(
                    fontSize: mediaQuery.size.width * 0.055,
                    color: Colors.white,
                    fontFamily: 'Northwell',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DestinationCard(
                    destination: 'Paris',
                    imagepath: 'images/paris.jpeg',
                    destinationText:
                        "Eiffel's steel soars, love's city it defines, Paris, where dreams intertwine.",
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.03,
                  ),
                  const DestinationCard(
                    destination: 'Mumbai',
                    destinationText:
                        "Bollywood's heartbeat, a vibrant throng, in Mumbai's rhythm, dreams belong.",
                    imagepath: 'images/mumbai.jpeg',
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.03,
                  ),
                  const DestinationCard(
                    destination: 'New York',
                    destinationText:
                        "Melting pot of cultures bold, New York's essence, a story untold.",
                    imagepath: 'images/newyork.jpg',
                  )
                ],
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.03,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DestinationCard(
                    destination: 'Amsterdam',
                    imagepath: 'images/amsterdam.jpeg',
                    destinationText:
                        "Canals weave tales of old and new, Amsterdam's charm, forever true.",
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.03,
                  ),
                  const DestinationCard(
                    destination: 'London',
                    imagepath: 'images/london.jpeg',
                    destinationText:
                        "Big Ben's chime marks moments grand, in London's pulse, a timeless brand.",
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.03,
                  ),
                  const DestinationCard(
                    destination: 'Barcelona',
                    imagepath: 'images/barcelona.jpeg',
                    destinationText:
                        "Catalan spirit, vibrant and free, in Barcelona's soul, find harmony.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key,
      required this.firstIcon,
      required this.text,
      required this.nextPage});

  final Icon? firstIcon;
  final String? text;
  final String? nextPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: firstIcon!,
      title: Text(text!,
          style: const TextStyle(
            fontSize: 16.0,
          )),
      trailing: TextButton(
        style: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(kBackGroundMaroonColor),
        ),
        onPressed: () {
          Navigator.pushNamed(context, nextPage!);
        },
        child: const Icon(
          Icons.arrow_forward_ios_sharp,
        ),
      ),
    );
  }
}

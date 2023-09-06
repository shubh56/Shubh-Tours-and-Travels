import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'constants.dart';



class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.destination,required this.imagepath,required this.destinationText});

  final String destination;
  final String imagepath;
  final String destinationText;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: mediaQuery.size.height *0.25,
      width: mediaQuery.size.width * 0.29,
      child: FlipCard(
        front:
        Container(
          height: 200.0,
          width: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagepath), fit: BoxFit.fill),
            border: Border.all(
              width: 5.0,
              color: kFontGoldColor,
            ),
          ),
          child: const SizedBox(
            height: 10,
          )
        ),
        back: Container(
          height: 200.0,
          width: 150.0,
          color: kFontGoldColor,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                destination,
                style: TextStyle(
                  fontSize: mediaQuery.size.width*0.045,
                  color: kBackGroundMaroonColor,
                  fontFamily: 'MPIDeco',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0,left: 20.0, right: 20.0,),
                child: Text(
                  destinationText,
                  style: TextStyle(
                    fontSize: mediaQuery.size.width*0.03,
                    color: kBackGroundMaroonColor,
                    fontFamily: 'serif',
                  ),
                ),
              ),
            ],
          ),
        ),
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        fill: Fill.fillBack,
      ),
    );
  }
}
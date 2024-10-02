import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Cardswip extends StatefulWidget {
  const Cardswip({Key? key}) : super(key: key);

  @override
  State<Cardswip> createState() => _CardswipState();
}

class _CardswipState extends State<Cardswip> {
  List<Container> cards = [
    Container(
        alignment: Alignment.center,
        child: Image.network(
            "https://i.pinimg.com/564x/03/bd/9e/03bd9e110cfa2e3a5c12ab0ee81d966e.jpg")),
    Container(
      alignment: Alignment.center,
      child: Image.asset('assets/img2.jpg'),
    ),
    Container(
      alignment: Alignment.center,
      child: Image.asset('assets/img2.jpg'),
    ),
    Container(
      alignment: Alignment.center,
      child: Image.asset('assets/img3.jpg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              4,
              (index) {
                return AspectRatio(
                  aspectRatio: 0.6,
                  child: CardSwiper(
                    padding: const EdgeInsets.all(1),
                    numberOfCardsDisplayed: 1,
                    cardsCount: cards.length,
                    cardBuilder: (context, index, percentThresholdX,
                            percentThresholdY) =>
                        cards[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

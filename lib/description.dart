import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchOn;
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text('⭐ Average Rating $vote'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              name,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Releasing on $launchOn',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                margin: const EdgeInsets.all(5),
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Text(description),
              )
            ],
          )
        ],
      ),
    );
  }
}

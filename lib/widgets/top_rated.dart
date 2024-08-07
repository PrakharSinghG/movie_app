import 'package:flutter/material.dart';
import 'package:movie_app/contants.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});

  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Rated Movies',
            style: TextStyle(fontSize: 26),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                commonUrl +
                                    toprated[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Text(toprated[index]['title'] ?? 'loading'),
                      ],
                    ),
                  ),
                );
              },
              itemCount: toprated.length,
            ),
          )
        ],
      ),
    );
  }
}

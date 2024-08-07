import 'package:flutter/material.dart';
import 'package:movie_app/contants.dart';
import 'package:movie_app/description.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Movies',
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trending[index]['title'],
                          description: trending[index]['overview'],
                          bannerurl:
                              commonUrl + trending[index]['backdrop_path'],
                          posterurl:
                              commonUrl + trending[index]['poster_path'],
                          vote: trending[index]['vote_average'].toString(),
                          launchOn: trending[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                commonUrl + trending[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Text(trending[index]['title'] ?? 'loading'),
                      ],
                    ),
                  ),
                );
              },
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}

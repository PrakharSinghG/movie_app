import 'package:flutter/material.dart';
import 'package:movie_app/contants.dart';

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});

  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular TV Shows',
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
                                    tv[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Text(tv[index]['original_name'] ?? 'loading'),
                      ],
                    ),
                  ),
                );
              },
              itemCount: tv.length,
            ),
          )
        ],
      ),
    );
  }
}

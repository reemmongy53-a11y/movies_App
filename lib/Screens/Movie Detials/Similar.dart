import 'package:flutter/material.dart';
import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/models/MoviesSuggestions/Movies.dart'; // مهم

class Similar extends StatelessWidget {
  final List<Movies> movies;

  const Similar({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Similar", style: Theme.of(context).textTheme.bodyLarge),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final m = movies[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.Details.name, arguments:  movies[index].id.toString(),);
                  },
                  child: Image.network(
                    m.mediumCoverImage ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

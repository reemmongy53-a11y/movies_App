import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/Screens/SearchScreen/Search_cubit.dart';
import 'package:movies_app/Screens/SearchScreen/Search_state.dart';
import 'package:movies_app/core/AppColor/color.dart';
import 'package:movies_app/core/AppImage/image.dart';

class Search extends StatelessWidget {
  final SearchCubit cubit;

  Search({required this.cubit});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
        backgroundColor: AppColor.black,
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff2B2B2B),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.white70),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) => cubit.searchMovie(value),
                        decoration: const InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is InitialState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.search, width: 180),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  }

                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.yellow),
                    );
                  }

                  if (state is ErrorState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }

                  if (state is SuccessState && state.movies.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.search, width: 180),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  }

                  if (state is SuccessState) {
                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.63,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoute.Details.name,
                              arguments: movie.id.toString(),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(movie.mediumCoverImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          movie.rating?.toString() ?? "0.0",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(Icons.star,
                                            color: Colors.yellow, size: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            )
          ]),
        ));
  }
}

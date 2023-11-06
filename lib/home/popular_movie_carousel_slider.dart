import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/home/cubit/movies_states.dart';
import 'package:flutter_movies_app/home/cubit/movies_view_model.dart';
import 'package:flutter_movies_app/my_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../api/api_constants.dart';

class PopularMoviesCarouselSlider extends StatefulWidget {
  @override
  State<PopularMoviesCarouselSlider> createState() =>
      _PopularMoviesCarouselSliderState();
}

class _PopularMoviesCarouselSliderState
    extends State<PopularMoviesCarouselSlider> {
  MoviesViewModel viewModel = MoviesViewModel();
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getPopularMovies();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<MoviesViewModel, MoviesStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is MoviesSuccessState) {
              return Container(
                color: MyTheme.blackColor,
                height: 280,
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: state.moviesList.length,
                      itemBuilder: (context, index, realIndex) {
                        selectedIndex = index;
                        return InkWell(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Image.network(
                                '${ApiConstants.imageUrl}${state.moviesList[index].posterPath}',
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                              Stack(
                                children: [
                                  Center(
                                    child: ImageIcon(
                                      const AssetImage(
                                        'assets/images/play_button.png',
                                      ),
                                      color: MyTheme.whiteColor,
                                      size: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        pageSnapping: true,
                        padEnds: false,
                        viewportFraction: 1,
                        clipBehavior: Clip.none,
                        height: 240.h,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Positioned(
                      bottom: -0.h,
                      right: 150.h,
                      child: SizedBox(
                        height: 200,
                        width: 250,
                        child: Stack(
                          children: [
                            Image.network(
                              "${ApiConstants.imageUrl}${state.moviesList[selectedIndex].posterPath}",
                              fit: BoxFit.fill,
                              height: double.infinity,
                            ),
                            Image.asset('assets/images/add_icon.png'),
                            Icon(
                              Icons.add,
                              color: MyTheme.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(state.moviesList[selectedIndex].title! ,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MyTheme.whiteColor,
                              fontSize: 18,
                          ),
                        ),
                        Text(state.moviesList[selectedIndex].releaseDate!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: MyTheme.whiteColor,
                            fontSize: 18,
                        ),),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is MoviesErrorState) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      state.errorMessage!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getPopularMovies();
                          setState(() {});
                        },
                        child: Text(
                          'Try again!!',
                          style: Theme.of(context).textTheme.titleSmall,
                        )),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
          },
        )
      ],
    );
  }
}

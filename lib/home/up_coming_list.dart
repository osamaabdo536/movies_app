import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/home/cubit/movies_states.dart';
import 'package:flutter_movies_app/home/cubit/movies_view_model.dart';
import '../api/api_constants.dart';
import '../my_theme.dart';

class UpComingList extends StatefulWidget {
  @override
  State<UpComingList> createState() => _UpComingListState();
}

class _UpComingListState extends State<UpComingList> {
  MoviesViewModel viewModel = MoviesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesViewModel,MoviesStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is MoviesSuccessState) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "New Released",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.whiteColor
                      )
                  ),
                ],
              ),
              Container(
                color: MyTheme.darkGry,
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.moviesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          child: Stack(
                            children: [
                              Image.network("${ApiConstants.imageUrl}${state.moviesList[index].posterPath}" ,
                                fit: BoxFit.fill,
                                height: double.infinity,
                              ),
                              Image.asset('assets/images/add_icon.png'),
                              Icon(Icons.add,color: MyTheme.whiteColor,),
                            ],
                          ),
                          height: 200,
                          width: 120,
                        ),
                      );
                    }),
              ),
            ],
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
    );




  }
}

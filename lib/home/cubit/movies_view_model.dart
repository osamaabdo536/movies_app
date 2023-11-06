import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/api/api_manger.dart';
import 'package:flutter_movies_app/home/cubit/movies_states.dart';

class MoviesViewModel extends Cubit<MoviesStates>{
  MoviesViewModel():super(MoviesLoadingState());

  Future<void> getPopularMovies() async {
    emit(MoviesLoadingState());
    try{
      var response = await ApiManger.getPopularMovies();
      if(response.statusCode != null){
        emit(MoviesErrorState(errorMessage: response.statusMessage!));
      }else{
        emit(MoviesSuccessState(moviesList: response.results ?? []));
      }
    }catch(e){
      emit(MoviesErrorState(errorMessage: e.toString()));
    }

  }

  Future<void> getTopRatedMovies() async {
    emit(MoviesLoadingState());
    try{
      var response = await ApiManger.getTopRatedMovies();
      if(response.statusCode != null){
        emit(MoviesErrorState(errorMessage: response.statusMessage!));
      }else{
        emit(MoviesSuccessState(moviesList: response.results ?? []));
      }
    }catch(e){
      emit(MoviesErrorState(errorMessage: e.toString()));
    }

  }

  Future<void> getUpComingMovies() async {
    emit(MoviesLoadingState());
    try{
      var response = await ApiManger.getUpcomingMovies();
      if(response.statusCode != null){
        emit(MoviesErrorState(errorMessage: response.statusMessage!));
      }else{
        emit(MoviesSuccessState(moviesList: response.results ?? []));
      }
    }catch(e){
      emit(MoviesErrorState(errorMessage: e.toString()));
    }

  }
}
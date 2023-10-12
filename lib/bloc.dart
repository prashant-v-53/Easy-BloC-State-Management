import 'package:bloc_demo/event.dart';
import 'package:bloc_demo/repo.dart';
import 'package:bloc_demo/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetDataList>((event, emit) async {
      try {
        emit(HomeLoading());
        final data = await apiRepository.fetchCovidList();
        emit(HomeLoaded(data!));
      } on NetworkError {
        emit(const HomeError("Failed to fetch data !!"));
      }
    });
  }
}

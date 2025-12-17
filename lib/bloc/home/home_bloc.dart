/*import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';
import '../../service/home_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<LoadApartments>(_onLoadApartments);
  }

  Future<void> _onLoadApartments(
    LoadApartments event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    try {
      final apartments = await getApartmentsList();
      emit(HomeLoaded(apartments));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}*/
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';
import '../../models/apartment_model.dart';
import '../../service/home_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<LoadApartments>(_onLoadApartments);
    on<SearchApartments>(_onSearchApartments);
  }

  /// نخزن كل الشقق الأصلية
  List<ApartmentModel> _allApartments = [];

  Future<void> _onLoadApartments(
    LoadApartments event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    try {
      final apartments = await getApartmentsList();

      _allApartments = apartments; // نخزن الأصل

      emit(HomeLoaded(apartments));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void _onSearchApartments(
    SearchApartments event,
    Emitter<HomeState> emit,
  ) {
    final query = event.query.toLowerCase();

    final filtered = _allApartments.where((apartment) {
      return apartment.id.toString().contains(query);
     // return apartment.name.toLowerCase().contains(query);
    }).toList();

    emit(HomeLoaded(filtered));
  }
}

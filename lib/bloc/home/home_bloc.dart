import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../models/apartment_model.dart';
import '../../service/home_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  double? _currentMinPrice;
  double? _currentMaxPrice;
  int? _currentRooms;
  String? _currentCity;
  String? _currentGovernorate;
  String _query = '';

  HomeBloc() : super(const HomeInitial()) {
    on<LoadApartments>(_onLoadApartments);
    on<SearchApartments>(_onSearchApartments);
    on<FilterApartments>(_onFilterApartments);
  }

  Future<void> _onLoadApartments(LoadApartments event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final results = await Future.wait([
        getApartmentsList(),
        getLocations(),
      ]);
      final apartments = results[0] as List<ApartmentModel>;
      final locations = results[1] as Map<String, List<String>>;
      emit(HomeLoaded(apartments, locations));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void _onSearchApartments(SearchApartments event, Emitter<HomeState> emit) {
    _query = event.query;
    add(FilterApartments(
      minPrice: _currentMinPrice,
      maxPrice: _currentMaxPrice,
      rooms: _currentRooms,
      governorate: _currentGovernorate,
      city: _currentCity,
    ));
  }

  Future<void> _onFilterApartments(FilterApartments event, Emitter<HomeState> emit) async {
    _currentMinPrice = event.minPrice;
    _currentMaxPrice = event.maxPrice;
    _currentRooms = event.rooms;
    _currentGovernorate = event.governorate?.toLowerCase();
    _currentCity = event.city?.toLowerCase();

    emit(const HomeLoading());

    try {
      final filteredList = await getFilteredApartments(
        _currentMinPrice,
        _currentMaxPrice,
        _currentRooms,
        _currentCity,
        _currentGovernorate,
        _query,
      );
      final locations = await getLocations();
      emit(HomeLoaded(filteredList, locations));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
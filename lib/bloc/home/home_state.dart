import 'package:equatable/equatable.dart';
import '../../models/apartment_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<ApartmentModel> apartments;
  final Map<String, List<String>> locations;
  
  const HomeLoaded(this.apartments, [this.locations = const {}]);

  @override
  List<Object?> get props => [apartments, locations];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessSate extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessSate(this.products);
}

class HomeErrorSate extends HomeState {}

class HomeNaviagteToWishlistScreen extends HomeActionState {}

class HomeNaviagteToCartScreen extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}

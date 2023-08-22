part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class ProductsWishlistButtonClicked extends HomeEvent {
  final ProductDataModel clickedModel;

  ProductsWishlistButtonClicked({required this.clickedModel});
}

class ProductsCartButtonClicked extends HomeEvent {
  final ProductDataModel clickedModel;

  ProductsCartButtonClicked({required this.clickedModel});
}

class HomeWishlistButtonNaviagte extends HomeEvent {}

class HomeCartButtonNaviagte extends HomeEvent {}

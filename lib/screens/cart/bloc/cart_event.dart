part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveFromEvent(this.productDataModel);
}

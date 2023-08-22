import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learning_bloc/data/cart_items.dart';
import 'package:learning_bloc/screens/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromEvent>(cartRemoveFromEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccesState(cartItems));
  }

  FutureOr<void> cartRemoveFromEvent(
      CartRemoveFromEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccesState(cartItems));
  }
}

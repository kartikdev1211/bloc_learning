import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learning_bloc/data/cart_items.dart';
import 'package:learning_bloc/data/grocery_data.dart';
import 'package:learning_bloc/data/wishlist_items.dart';
import 'package:learning_bloc/screens/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(homeEvent);
    on<ProductsWishlistButtonClicked>(productsWishlistButtonClicked);
    on<ProductsCartButtonClicked>(productsCartButtonClicked);
    on<HomeWishlistButtonNaviagte>(homeWishlistButtonNavigate);
    on<HomeCartButtonNaviagte>(homeCartButtonNavigate);
  }

  FutureOr<void> homeEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    // await Future.delayed(
    //   const Duration(seconds: 3),
    // );
    emit(
      HomeLoadedSuccessSate(
        GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e["description"],
                price: e["price"],
                imageUrl: e["imageUrl"],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> productsWishlistButtonClicked(
      ProductsWishlistButtonClicked event, Emitter<HomeState> emit) {
    print("WishList Product Clicked");
    wishlistItems.add(event.clickedModel);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> productsCartButtonClicked(
      ProductsCartButtonClicked event, Emitter<HomeState> emit) {
    print("CartProduct Clicked");
    cartItems.add(event.clickedModel);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigate(
      HomeWishlistButtonNaviagte event, Emitter<HomeState> emit) {
    print("Wishlist clicked");
    emit(HomeNaviagteToWishlistScreen());
  }

  FutureOr<void> homeCartButtonNavigate(
      HomeCartButtonNaviagte event, Emitter<HomeState> emit) {
    print("Cart clicked");
    emit(HomeNaviagteToCartScreen());
  }
}

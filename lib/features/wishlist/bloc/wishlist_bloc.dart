import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/data/wishlist.dart';
import 'package:flutter_bloc_practice/features/home/product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(_WishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(_WishlistRemoveFromWishlistEvent);
  }
}

FutureOr<void> _WishlistInitialEvent(
    WishlistInitialEvent event, Emitter<WishlistState> emit) {
  print("Emitting WishlistSuccessState");

  emit(WishlistSuccessState(wishlistItems: wishlistItems));
}

FutureOr<void> _WishlistRemoveFromWishlistEvent(
    WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
  wishlistItems.remove(event.productDataModel);
  emit(WishlistSuccessState(wishlistItems: wishlistItems));
}

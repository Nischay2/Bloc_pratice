part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> product;
  HomeLoadedSuccessState({required this.product});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}


class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemsWishlistActionState extends HomeActionState {}

class HomeProductItemsCartActionState extends HomeActionState {}






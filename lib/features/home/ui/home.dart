import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/features/cart/ui/cart.dart';
import 'package:flutter_bloc_practice/features/home/ui/product_tile_widet.dart';
import 'package:flutter_bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_practice/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        buildWhen: (previous, current) => current is! HomeActionState,
        listenWhen: (previous, current) => current is HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          } else if (state is HomeNavigateToWishListPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Wishlist()));
          } else if (state is HomeProductItemsWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added in WishList")));
          } else if (state is HomeProductItemsCartActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added in Cart")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                body: Center(child: CircularProgressIndicator(
                  color: Colors.teal,
                )),
              );
            case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Text('My Grocery App'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: Icon(Icons.shopping_bag_outlined))
                  ],
                ),
                body: ListView.builder(
                  itemCount:  successState.product.length,
                  itemBuilder: (context, index){
                  return ProductTileWidet(productDataModel: successState.product[index], homeBloc: homeBloc,);
                }
                ),
              );
            case HomeErrorState:
              return Scaffold(
                body: Text('Error'),
              );
            default:
              return SizedBox();
          }
        });
  }
}

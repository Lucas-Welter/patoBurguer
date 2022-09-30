import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pato_burguer/models/cart.dart';
import 'package:pato_burguer/models/order_list.dart';
import 'package:pato_burguer/models/product_list.dart';
import 'package:pato_burguer/pages/cart_page.dart';
import 'package:pato_burguer/pages/orders_page.dart';
import 'package:pato_burguer/pages/product_detail_page.dart';
import 'package:pato_burguer/pages/product_form_page.dart';
import 'package:pato_burguer/pages/products_overview_page.dart';
import 'package:pato_burguer/pages/products_page.dart';
import 'package:pato_burguer/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        // home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

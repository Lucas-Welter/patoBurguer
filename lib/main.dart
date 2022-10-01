import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pato_burguer/models/auth.dart';
import 'package:pato_burguer/models/product_list.dart';
import 'package:pato_burguer/pages/auth_or_home_page.dart';
import 'package:pato_burguer/pages/product_detail_page.dart';
import 'package:pato_burguer/pages/product_form_page.dart';
import 'package:pato_burguer/pages/products_page.dart';
import 'package:pato_burguer/utils/app_routes.dart';
import 'package:pato_burguer/utils/custom_route.dart';

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
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previous) {
            return ProductList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
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
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.iOS: CustomPageTransitionsBuilder(),
              TargetPlatform.android: CustomPageTransitionsBuilder(),
            },
          ),
        ),
        // home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.authOrHome: (ctx) => const AuthOrHomePage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

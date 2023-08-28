import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_task/core/app_theme.dart';
import 'package:k_task/feature/product/presentation/manager/product_cubit.dart';
import 'package:k_task/feature/product/presentation/screen/add_product_screen.dart';
import 'package:k_task/feature/product/presentation/screen/product_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit()..getProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ProductScreen.routeName,
        routes: {
          ProductScreen.routeName: (_) => ProductScreen(),
          AddProductScreen.routeName: (_) => const AddProductScreen(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}

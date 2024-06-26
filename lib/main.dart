import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/pages/welcome_page.dart';
import 'package:test_telkomsat2/providers/add_product_provider.dart';
import 'package:test_telkomsat2/providers/delete_product_provider.dart';
import 'package:test_telkomsat2/providers/detail_product_provider.dart';
import 'package:test_telkomsat2/providers/login_provider.dart';
import 'package:test_telkomsat2/providers/products_provider.dart';
import 'package:test_telkomsat2/providers/update_product_provider.dart';
import 'package:test_telkomsat2/providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DeleteProductProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}

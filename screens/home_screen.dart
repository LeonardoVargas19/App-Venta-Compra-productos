import 'package:flutter/material.dart';
import 'package:productos_app/models/prodct.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/productsServices.dart';

import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final productService = Provider.of<ProductsService>(context);
    if (productService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
          itemCount: productService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                final selectedProduct = productService.products[index].copy();
                productService.selectedProduct = selectedProduct;
                Navigator.pushNamed(context, 'product');
              },
              child: ProductCard(
                product: productService.products[index],
              ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productService.selectedProduct =
              new Product(available: true, price: 0.0, name: '');
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}

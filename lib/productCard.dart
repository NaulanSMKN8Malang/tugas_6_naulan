import 'package:flutter/material.dart';
import 'package:tugas_6_naulan/main.dart';
import 'package:tugas_6_naulan/model/product.dart';
import 'package:tugas_6_naulan/repository/DataRepository.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final DataRepository repository = new DataRepository();

  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          children: [
            Image.network(
                "https://cdn.pixabay.com/photo/2017/10/13/12/05/cool-shoes-2847458_960_720.png"),
            Column(
              children: [
                Text(product.name),
                Text(product.productId),
                Text(product.stock.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

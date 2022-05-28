import 'package:flutter/material.dart';
import 'package:tugas_6_naulan/main.dart';
import 'package:tugas_6_naulan/model/product.dart';
import 'package:tugas_6_naulan/repository/DataRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugas_6_naulan/productCard.dart';

class HomeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return _buildHome(context);
  }

  Widget _buildHome(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: repository.getStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data?.docs ?? []);
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
        padding: EdgeInsets.all(10),
        children:
            snapshot.map((data) => _buildListItem(context, data)).toList());
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    var product = Product.fromSnapshot(snapshot);
    return ProductCard(product: product);
  }
}

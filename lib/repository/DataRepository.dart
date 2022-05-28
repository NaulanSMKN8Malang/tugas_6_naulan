import 'package:tugas_6_naulan/model/product.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class DataRepository {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');
  Stream<QuerySnapshot> getStream() {
    return collectionReference.snapshots();
  }
}

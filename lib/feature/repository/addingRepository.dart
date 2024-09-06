import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/common/firebase_providers.dart';
import '../../model/reverpordModel.dart';
final addingRepositoryProvider=Provider((ref) => AddingRepository(firestore:ref.watch(fireStoreProvider)));

class AddingRepository{
  final FirebaseFirestore _firestore;

  AddingRepository({
    required FirebaseFirestore firestore
  }): _firestore=firestore;

  CollectionReference get _detail => _firestore.collection("detail");

  adding({required RiverpordModel  reverpordModel}) {
    _detail.add(reverpordModel.toMap()).then((value) {
      value.update({
        "id":value.id

    });
    });
  }

}
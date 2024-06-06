import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/bookings/screen/bookings_users.dart';

import '../../../core/Provider/provider.dart';
import '../../../models/bookings_model.dart';

final bookingsRepositoryProvider=Provider((ref) => BookingsRepository(firestore: ref.watch(firestoreprovider)));
class BookingsRepository {
  final FirebaseFirestore _firestore;

  BookingsRepository({required FirebaseFirestore firestore })
      :_firestore=firestore;

  CollectionReference get _bookings => _firestore.collection("BookingDetails");

  Stream<List<BookingAddressModel>> streamingData(String userId) {
    return _bookings.where("BuyerId", isEqualTo: userId).snapshots().map((event) => event.docs.map((e) =>
        BookingAddressModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }
}
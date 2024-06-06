import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/bookings_model.dart';
import '../repository/bookings_repository.dart';

final bookingsControllerProvider=Provider((ref) => BookingsCondroller(bookingsRepository: ref.watch(bookingsRepositoryProvider)));
final streambookings=StreamProvider.family((ref, String userId) => ref.watch(bookingsControllerProvider).streamBookingsData(userId));

class BookingsCondroller {
  final BookingsRepository _bookingsRepository;

  BookingsCondroller({required BookingsRepository bookingsRepository})
      :_bookingsRepository=bookingsRepository;

  Stream<List<BookingAddressModel>> streamBookingsData(String userId) {
    return _bookingsRepository.streamingData(userId);
  }
}
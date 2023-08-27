import 'package:appetizer/domain/models/coupon/coupon.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coupons_page_event.dart';
part 'coupons_page_state.dart';

class CouponsPageBloc extends Bloc<CouponsPageEvent, CouponsPageState> {
  CouponsPageBloc() : super(const CouponsPageInitialState()) {
    on<CouponsPageFetchEvent>(
        (CouponsPageFetchEvent event, Emitter<CouponsPageState> emit) {
      // TODO: implement repository call
      bool submissionSuccessful = true;
      List<Coupon> coupons = [
        Coupon(id: 202, meal: "Breakfast, 12 August", title: "CPN202"),
        Coupon(id: 202, meal: "Breakfast, 12 August", title: "CPN202"),
        Coupon(id: 202, meal: "Breakfast, 12 August", title: "CPN202"),
        Coupon(id: 202, meal: "Breakfast, 12 August", title: "CPN202"),
        Coupon(id: 202, meal: "Breakfast, 12 August", title: "CPN202"),
        Coupon(id: 202, meal: "Breakfast, 12 August", title: "CPN202"),
        Coupon(id: 202, meal: "Breakfast, 12 August", title: "CPN202"),
      ];
      if (submissionSuccessful) {
        emit(
          CouponsPageFetchedState(
            coupons: coupons,
          ),
        );
      }
      // else {
      //   emit(
      //     CouponsPageFailedState(
      //       coupons: event.coupons,
      //     ),
      //   );
      // }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'states/app_manager_state.dart';

@singleton
class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerInitial());

  // Future<void> emitUnauthorizedState() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove("user");
  //   prefs.remove("token");
  //   prefs.setBool("is_login", false);
  //   emit(UnauthorizedState());
  // }

  void emitRoadSignChanged({void Function()? onStateLitened}) {
    emit(RoadSignChanged(onStateLitened: onStateLitened));
  }

  void emitReservationAdded() {
    emit(ReservationChanged());
  }

  void emitChange(String type) {
    AppManagerState? state;
    switch (type) {
      case "1":
        state = RoadSignChanged();
      case "2":
        state = ReservationChanged();
      case "3":
        state = CustomerChanged();
      case "4":
        state = TemplatesChanged();
      case "5":
        state = ProfitsChanged();
      case "6":
        state = PaymentsChanged();
    }
    if (state != null) emit(state);
  }
}

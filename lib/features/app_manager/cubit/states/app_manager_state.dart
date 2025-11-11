part of '../app_manager_cubit.dart';

@immutable
abstract class AppManagerState {}

final class AppManagerInitial extends AppManagerState {}

//final class UnauthorizedState extends AppManagerState {}

final class RoadSignChanged extends AppManagerState {
  final void Function()? onStateLitened;

  RoadSignChanged({this.onStateLitened});
}

final class ReservationChanged extends AppManagerState {}

final class CustomerChanged extends AppManagerState {}

final class TemplatesChanged extends AppManagerState {}

final class ProfitsChanged extends AppManagerState {}

final class PaymentsChanged extends AppManagerState {}

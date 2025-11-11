part of '../auth_cubit.dart';

@immutable
abstract class TenantAvailabilityState extends AuthState {}

class TenantAvailabilityInitial extends TenantAvailabilityState {}

class TenantAvailabilitySuccess extends TenantAvailabilityState {
  TenantAvailabilitySuccess(this.tenantAvailability);
  final TenantAvailabilityModel tenantAvailability;
}

class TenantAvailabilityLoading extends TenantAvailabilityState {}

class TenantAvailabilityFail extends TenantAvailabilityState {
  TenantAvailabilityFail(this.error);

  final String error;
}

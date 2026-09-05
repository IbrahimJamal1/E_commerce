part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {
  final String orderId;

  CheckoutSuccess(this.orderId);
}

final class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError(this.message);
}

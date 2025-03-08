part of 'bills_cubit.dart';

@immutable
sealed class BillsState {}

final class BillsInitial extends BillsState {}

class BillsLoadingImage extends BillsState {}

class BillsLoadedImage extends BillsState {}

class BillsCreateError extends BillsState {
  final String message;

  BillsCreateError({required this.message});
}

class BillsCreateLoading extends BillsState {}

class BillsCreateLoaded extends BillsState {}

class BillsError extends BillsState {
  final String message;

  BillsError({required this.message});
}

class BillsLoading extends BillsState {}

class BillsLoaded extends BillsState {}

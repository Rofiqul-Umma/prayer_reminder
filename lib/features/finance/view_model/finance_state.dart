import 'package:equatable/equatable.dart';
import 'package:prayer_reminder/features/finance/model/expanses_model.dart';

sealed class FinanceState extends Equatable {
  const FinanceState();

  @override
  List<Object?> get props => [];
}

class FinanceInitialState extends FinanceState {
  const FinanceInitialState();
}

class AddExpanseLoading extends FinanceState {
  const AddExpanseLoading();
}

class AddExpanseSuccess extends FinanceState {}

class AddExpanseError extends FinanceState {
  final String error;

  const AddExpanseError(this.error);

  @override
  List<Object?> get props => [error];
}

class GetExpansesLoading extends FinanceState {
  const GetExpansesLoading();
}

class GetExpansesSuccess extends FinanceState {
  final List<ExpansesModel> expanses;

  const GetExpansesSuccess(this.expanses);

  @override
  List<Object?> get props => [expanses];
}

class GetExpansesEmpty extends FinanceState {
  const GetExpansesEmpty();
}

class GetExpansesError extends FinanceState {
  final String error;

  const GetExpansesError(this.error);

  @override
  List<Object?> get props => [error];
}

class DeleteExpanseLoading extends FinanceState {
  const DeleteExpanseLoading();
}

class DeleteExpanseSuccess extends FinanceState {
  final String id;

  const DeleteExpanseSuccess(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteExpanseError extends FinanceState {
  final String error;

  const DeleteExpanseError(this.error);

  @override
  List<Object?> get props => [error];
}

class UpdateExpanseLoading extends FinanceState {
  const UpdateExpanseLoading();
}

class UpdateExpanseSuccess extends FinanceState {
  final ExpansesModel data;

  const UpdateExpanseSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class UpdateExpanseError extends FinanceState {
  final String error;

  const UpdateExpanseError(this.error);

  @override
  List<Object?> get props => [error];
}

class FilterExpansesByMonthYearLoading extends FinanceState {
  const FilterExpansesByMonthYearLoading();
}

class FilterExpansesByMonthYearSuccess extends FinanceState {
  final List<ExpansesModel> filteredExpanses;

  const FilterExpansesByMonthYearSuccess(this.filteredExpanses);

  @override
  List<Object?> get props => [filteredExpanses];
}

class FilterExpansesByMonthYearError extends FinanceState {
  final String error;

  const FilterExpansesByMonthYearError(this.error);

  @override
  List<Object?> get props => [error];
}

// empty
class FilterExpansesByMonthYearEmpty extends FinanceState {
  const FilterExpansesByMonthYearEmpty();
}

import 'package:prayer_reminder/features/finance/model/expanses_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'finance_state.freezed.dart';

@freezed
class FinanceState with _$FinanceState {
  const factory FinanceState.initial() = FinanceInitialState;

  const factory FinanceState.addExpanseLoading() = AddExpanseLoading;
  const factory FinanceState.addExpanseSuccess() = AddExpanseSuccess;
  const factory FinanceState.addExpanseError(String error) = AddExpanseError;

  const factory FinanceState.getExpansesLoading() = GetExpansesLoading;
  const factory FinanceState.getExpansesSuccess(List<ExpansesModel> expanses) =
      GetExpansesSuccess;
  const factory FinanceState.getExpansesEmpty() = GetExpansesEmpty;
  const factory FinanceState.getExpansesError(String error) = GetExpansesError;

  const factory FinanceState.deleteExpanseLoading() = DeleteExpanseLoading;
  const factory FinanceState.deleteExpanseSuccess(String id) =
      DeleteExpanseSuccess;
  const factory FinanceState.deleteExpanseError(String error) =
      DeleteExpanseError;

  const factory FinanceState.updateExpanseLoading() = UpdateExpanseLoading;
  const factory FinanceState.updateExpanseSuccess(ExpansesModel data) =
      UpdateExpanseSuccess;
  const factory FinanceState.updateExpanseError(String error) =
      UpdateExpanseError;

  const factory FinanceState.filterExpansesByMonthYearLoading() =
      FilterExpansesByMonthYearLoading;
  const factory FinanceState.filterExpansesByMonthYearSuccess(
    List<ExpansesModel> filteredExpanses,
  ) = FilterExpansesByMonthYearSuccess;
  const factory FinanceState.filterExpansesByMonthYearError(String error) =
      FilterExpansesByMonthYearError;
  const factory FinanceState.filterExpansesByMonthYearEmpty() =
      FilterExpansesByMonthYearEmpty;
}

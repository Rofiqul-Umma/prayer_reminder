import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:prayer_reminder/features/finance/model/expanses_model.dart';
import 'package:prayer_reminder/features/finance/service/finance_service.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_state.dart';

class FinanceViewModel extends Cubit<FinanceState> {
  final FinanceService _financeService;
  FinanceViewModel(this._financeService) : super(FinanceInitialState()) {
    init();
  }

  Future<void> init() async {
    await _financeService.init();
    await getFinanceData();
  }

  String? selectedCategory;

  int _totalExpanses = 0;
  int get totalExpanses => _totalExpanses;

  void setSelectedCategory(String? category) {
    if (category != null) {
      selectedCategory = category;
      emit(FinanceInitialState());
    }
  }

  Future<void> saveFinanceData(String description, int amount) async {
    emit(AddExpanseLoading());
    try {
      if (selectedCategory == null) {
        throw Exception('Category cannot be empty');
      }
      if (description.trim().isEmpty) {
        throw Exception('Description cannot be empty');
      }
      if (amount <= 0) {
        throw Exception('Amount must be greater than zero');
      }

      final data = ExpansesModel(
        category: selectedCategory!,
        description: description,
        amount: amount,
      );

      await _financeService.saveFinanceData(data);
      emit(AddExpanseSuccess());
    } catch (e) {
      emit(AddExpanseError('$e'));
    }
  }

  Future<void> getFinanceData() async {
    emit(GetExpansesLoading());
    try {
      final expanses = await _financeService.getFinanceData();
      if (expanses.isEmpty) {
        emit(GetExpansesEmpty());
      } else {
        final currentMonthData = await _getCurrentMonthData(expanses);
        _totalExpanses = currentMonthData.fold(
          0,
          (sum, item) => sum + item.amount,
        );
        currentMonthData.sort((a, b) => b.date.compareTo(a.date));
        emit(GetExpansesSuccess(currentMonthData));
      }
    } catch (e) {
      emit(GetExpansesError('$e'));
    }
  }

  Future<List<ExpansesModel>> _getCurrentMonthData(
    List<ExpansesModel> expanses,
  ) async {
    final now = DateTime.now();
    return await Isolate.run(
      () =>
          expanses.where((item) {
            return item.date.month == now.month && item.date.year == now.year;
          }).toList(),
    );
  }

  Future<void> deleteFinanceData(String id) async {
    emit(DeleteExpanseLoading());
    try {
      await _financeService.deleteFinanceData(id);
      emit(DeleteExpanseSuccess(id));
    } catch (e) {
      emit(DeleteExpanseError('$e'));
    }
  }

  Future<void> updateFinanceData(String id, ExpansesModel data) async {
    emit(UpdateExpanseLoading());
    try {
      await _financeService.updateFinanceData(id, data);
      emit(UpdateExpanseSuccess(data));
    } catch (e) {
      emit(UpdateExpanseError('$e'));
    }
  }
}

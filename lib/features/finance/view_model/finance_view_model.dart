import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:date_format/date_format.dart';
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
    await getFinanceDataByMonthAndYear(_selectedMonth, _selectedYear);
    await getTotalExpansesPerMonthInYear();
  }

  String? selectedCategory;

  int _totalExpanses = 0;
  int get totalExpanses => _totalExpanses;

  List<ExpansesModel> _expanses = [];
  List<ExpansesModel> get expanses => _expanses;

  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  String _selectedMonth = formatDate(DateTime.now(), [MM]);
  String get selectedMonth => _selectedMonth;

  String _selectedYear = DateTime.now().year.toString();
  String get selectedYear => _selectedYear;

  List<int> _monthlyTotal = [];
  List<int> get monthlyTotals => _monthlyTotal;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('FinanceViewModel error: $error');
  }

  @override
  void onChange(Change<FinanceState> change) {
    super.onChange(change);
    print('FinanceViewModel state changed: ${change.currentState}');
  }

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
        _expanses = currentMonthData;
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

  Future<List<ExpansesModel>> filterFinanceDataByMonthYear(
    String month,
    String year,
  ) async => await _financeService.getFinanceData().then(
    (value) async => await Isolate.run(
      () =>
          value
              .where(
                (expanse) =>
                    expanse.date.month == int.parse(month) &&
                    expanse.date.year == int.parse(year),
              )
              .toList(),
    ),
  );

  Future<void> getFinanceDataByMonthAndYear(String month, String year) async {
    final _currentMonth =
        monthNames.contains(month)
            ? monthNames.indexOf(month) + 1
            : DateTime.now().month;
    emit(FilterExpansesByMonthYearLoading());
    try {
      final expanses = await filterFinanceDataByMonthYear(
        _currentMonth.toString(),
        year,
      );
      if (expanses.isEmpty) {
        emit(FilterExpansesByMonthYearEmpty());
      } else {
        _totalExpanses = expanses.fold(0, (sum, item) => sum + item.amount);
        expanses.sort((a, b) => b.date.compareTo(a.date));
        _expanses = expanses;
        emit(FilterExpansesByMonthYearSuccess(expanses));
      }
    } catch (e) {
      emit(FilterExpansesByMonthYearError('$e'));
    }
  }

  // get total expanses per month in a year
  Future<List<int>> getTotalExpansesPerMonthInYear() async {
    final allExpanses = await _financeService.getFinanceData();
    for (var month = 1; month <= 12; month++) {
      final total = await Isolate.run(
        () => allExpanses
            .where(
              (expanse) =>
                  expanse.date.year == DateTime.now().year &&
                  expanse.date.month == month,
            )
            .fold(0, (sum, item) => sum + item.amount),
      );
      monthlyTotals.add(total);
    }

    return monthlyTotals;
  }

  void setSelectedMonth(String month) {
    _selectedMonth = month;
    emit(FinanceInitialState());
  }

  void setSelectedYear(String year) {
    _selectedYear = year;
    emit(FinanceInitialState());
  }
}

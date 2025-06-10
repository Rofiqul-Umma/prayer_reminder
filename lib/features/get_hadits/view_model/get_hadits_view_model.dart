import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:prayer_reminder/features/get_hadits/model/data_hadiths.dart';
import 'package:prayer_reminder/features/get_hadits/model/get_hadits_model.dart';
import 'package:prayer_reminder/features/get_hadits/service/get_hadits_service.dart';
import 'package:prayer_reminder/features/get_hadits/view_model/get_hadits_state.dart';

class GetHaditsViewModel extends Cubit<GetHaditsState> {
  final GetHaditsService service;
  GetHaditsViewModel(this.service) : super(GetHaditsInitialState()) {
    init();
  }

  String _currentQuote = '';
  String get currentQuote => _currentQuote;

  @override
  void onChange(Change<GetHaditsState> change) {
    debugPrint('GetHaditsViewModel state changed: ${change.currentState}');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('GetHaditsViewModel error: $error');
    super.onError(error, stackTrace);
  }

  void init() async {
    service.init();
    getHadits();
    setCurrenQuote();
  }

  Future<void> getHadits() async {
    emit(GetHaditsLoadingState());
    try {
      final result = await service.getHadits();
      result.fold((error) => emit(GetHaditsErrorState(error)), (data) {
        final converted = GetHaditsModel.fromJson(jsonDecode(data.data));
        emit(GetHaditsSuccessState(converted.data.hadiths));
      });
    } catch (e) {
      emit(GetHaditsErrorState('$e'));
    }
  }

  void setCurrenQuote() {
    final quotes = dataQuotes;
    quotes.shuffle();
    _currentQuote = quotes.first;
  }
}

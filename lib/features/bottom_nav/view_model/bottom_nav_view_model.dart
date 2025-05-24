import 'package:bloc/bloc.dart';

class BottomNavViewModel extends Cubit<int> {
  BottomNavViewModel() : super(0);

  void onItemTapped(int index) {
    emit(index);
  }
}

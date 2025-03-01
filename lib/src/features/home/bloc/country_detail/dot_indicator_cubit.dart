import 'package:flutter_bloc/flutter_bloc.dart';

class DotIndicatorCubit extends Cubit<int>{
  DotIndicatorCubit(): super(0);

  void goToPage(int index) => emit(index);

  void reset() => emit(0);
}
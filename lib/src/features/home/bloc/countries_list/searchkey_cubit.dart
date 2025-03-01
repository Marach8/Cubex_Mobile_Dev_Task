import 'package:flutter_bloc/flutter_bloc.dart';

class SearchkeyCubit extends Cubit<String>{
  SearchkeyCubit() : super('');

  void updateSearchKey(String searchKey) => emit(searchKey);
}
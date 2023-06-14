import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/home_repo.dart';
import 'get_headlines_state.dart';

class GetHeadLinesCubit extends Cubit<GetHeadLinesState> {
  GetHeadLinesCubit(this.homeRepo) : super(GetHeadLinesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchGetHeadLines() async {
    emit(GetHeadLinesLoading());
    var result = await homeRepo.fetchHeadLines();
    result.fold((failure) {
      emit(GetHeadLinesFailure(failure.errMessage));
    }, (headlines) {
      emit(GetHeadLinesSuccess(headlines));
    });
  }
}
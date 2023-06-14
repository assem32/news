
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repos/home_repo.dart';
import 'get_headlines_category__state.dart';

class GetHeadLinesCategoryCubit extends Cubit<GetHeadLinesCategoryState> {
  GetHeadLinesCategoryCubit(this.homeRepo) : super(GetHeadLinesCategoryInitial());

  final HomeRepo homeRepo;

  Future<void> fetchGetHeadLinesBusiness() async {
    emit(GetHeadLinesBusinessLoading());
    var result = await homeRepo.fetchHeadLinesCategory(category: 'business');
    result.fold((failure) {
      emit(GetHeadLinesBusinessFailure(failure.errMessage));
    }, (articles) {
      emit(GetHeadLinesBusinessSuccess(articles));
    });
  }
  Future<void> fetchGetHeadLinesTechnology() async {
    emit(GetHeadLinesTechnologyLoading());
    var result = await homeRepo.fetchHeadLinesCategory(category: 'technology');
    result.fold((failure) {
      emit(GetHeadLinesTechnologyFailure(failure.errMessage));
    }, (articles) {
      emit(GetHeadLinesTechnologySuccess(articles));
    });
  }
}

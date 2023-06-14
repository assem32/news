
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repos/home_repo.dart';
import 'get_headlines_category__state.dart';

class GetHeadLinesCategoryCubit extends Cubit<GetHeadLinesCategoryState> {
  GetHeadLinesCategoryCubit(this.homeRepo) : super(GetHeadLinesCategoryInitial());

  final HomeRepo homeRepo;

  Future<void> fetchGetHeadLinesBusiness() async {
    emit(GetHeadLinesCategoryLoading());
    var result = await homeRepo.fetchHeadLinesCategory(category: 'business');
    result.fold((failure) {
      emit(GetHeadLinesCategoryFailure(failure.errMessage));
    }, (articles) {
      emit(GetHeadLinesCategorySuccess(articles));
    });
  }
  Future<void> fetchGetHeadLinesTechnology() async {
    emit(GetHeadLinesCategoryLoading());
    var result = await homeRepo.fetchHeadLinesCategory(category: 'technology');
    result.fold((failure) {
      emit(GetHeadLinesCategoryFailure(failure.errMessage));
    }, (articles) {
      emit(GetHeadLinesCategorySuccess(articles));
    });
  }
}

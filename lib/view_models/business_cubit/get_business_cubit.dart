
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repos/home_repo.dart';
import 'get_business_state.dart';

class GetBusinessCubit extends Cubit<GetBusinessState> {
  GetBusinessCubit(this.homeRepo) : super(GetBusinessInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBusiness() async {
    emit(GetBusinessLoading());
    var result = await homeRepo.fetchHeadLinesCategory(category: 'business');
    result.fold((failure) {
      emit(GetBusinessFailure(failure.errMessage));
    }, (articles) {
      emit(GetBusinessSuccess(articles));
    });
  }

}

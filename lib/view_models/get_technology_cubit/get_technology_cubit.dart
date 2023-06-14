
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repos/home_repo.dart';
import 'get_technology__state.dart';

class GetTechnologyCubit extends Cubit<GetTechnologyState> {
  GetTechnologyCubit(this.homeRepo) : super(GetTechnologyInitial());

  final HomeRepo homeRepo;
  Future<void> fetchTechnology() async {
    emit(GetTechnologyLoading());
    var result = await homeRepo.fetchHeadLinesCategory(category: 'technology');
    result.fold((failure) {
      emit(GetTechnologyFailure(failure.errMessage));
    }, (articles) {
      emit(GetTechnologySuccess(articles));
    });
  }
}

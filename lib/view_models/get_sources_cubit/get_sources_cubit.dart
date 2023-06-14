import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/home_repo.dart';
import 'get_sources_state.dart';


class GetSourcesCubit extends Cubit<GetSourcesState> {
  GetSourcesCubit(this.homeRepo) : super(GetSourcesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchGetSources() async {
    emit(GetSourcesLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetSourcesFailure(failure.errMessage));
    }, (sources) {
      emit(GetSourcesSuccess(sources));
    });
  }
}

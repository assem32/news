import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/sources_model.dart';
import '../../repos/home_repo.dart';
import 'get_explore_state.dart';

class GetExploreCubit extends Cubit<GetExploreState> {
  GetExploreCubit(this.homeRepo) : super(GetExploreInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBBC({required String exploreKey}) async {
    emit(GetExploreBBCLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetExploreBBCFailure(failure.errMessage));
    }, (sources) {
      List<Sources> bbcList =
          sources.where((source) => source.id == exploreKey).toList();
      emit(GetExploreBBCSuccess(bbcList));
    });
  }

  // Future<void> fetchAlJazzera() async {
  //   emit(GetExploreAlJazzeraLoading());
  //   var result = await homeRepo.fetchSources();
  //   result.fold((failure) {
  //     emit(GetExploreAlJazzeraFailure(failure.errMessage));
  //   }, (sources) {
  //     List<Sources> alJazzeraList =
  //         sources.where((source) => source.id == 'al-jazeera-english').toList();
  //     emit(GetExploreAlJazzeraSuccess(alJazzeraList));
  //   });
  // }
  //
  // Future<void> fetchSabq() async {
  //   emit(GetExploreSabqLoading());
  //   var result = await homeRepo.fetchSources();
  //   result.fold((failure) {
  //     emit(GetExploreSabqFailure(failure.errMessage));
  //   }, (sources) {
  //     List<Sources> sabqList =
  //         sources.where((source) => source.id == 'sabq').toList();
  //     emit(GetExploreSabqSuccess(sabqList));
  //   });
  // }
  //
  // Future<void> fetchABC() async {
  //   emit(GetExploreABCLoading());
  //   var result = await homeRepo.fetchSources();
  //   result.fold((failure) {
  //     emit(GetExploreABCFailure(failure.errMessage));
  //   }, (sources) {
  //     List<Sources> abcList =
  //         sources.where((source) => source.id == 'abc-news').toList();
  //     emit(GetExploreABCSuccess(abcList));
  //   });
  // }
  //
  // Future<void> fetchArgaam() async {
  //   emit(GetExploreArgaamLoading());
  //   var result = await homeRepo.fetchSources();
  //   result.fold((failure) {
  //     emit(GetExploreArgaamFailure(failure.errMessage));
  //   }, (sources) {
  //     List<Sources> argaamList =
  //         sources.where((source) => source.id == 'argaam').toList();
  //     emit(GetExploreArgaamSuccess(argaamList));
  //   });
  // }
  //
  // Future<void> fetchBloomberg() async {
  //   emit(GetExploreBloombergLoading());
  //   var result = await homeRepo.fetchSources();
  //   result.fold((failure) {
  //     emit(GetExploreBloombergFailure(failure.errMessage));
  //   }, (sources) {
  //     List<Sources> bloombergList =
  //         sources.where((source) => source.id == 'bloomberg').toList();
  //     emit(GetExploreBloombergSuccess(bloombergList));
  //   });
  // }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/sources_model.dart';
import '../../repos/home_repo.dart';
import 'get_explore_state.dart';

class GetExploreCubit extends Cubit<GetExploreState> {
  GetExploreCubit(this.homeRepo) : super(GetExploreInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBBC() async {
    emit(GetExploreLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetExploreFailure(failure.errMessage));
    }, (sources) {
      List<Sources> bbcList =
          sources.where((source) => source.id == 'bbc-news').toList();
      emit(GetExploreSuccess(bbcList));
    });
  }

  Future<void> fetchAlJazzera() async {
    emit(GetExploreLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetExploreFailure(failure.errMessage));
    }, (sources) {
      List<Sources> alJazzeraList =
          sources.where((source) => source.id == 'al-jazeera-english').toList();
      emit(GetExploreSuccess(alJazzeraList));
    });
  }

  Future<void> fetchSabq() async {
    emit(GetExploreLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetExploreFailure(failure.errMessage));
    }, (sources) {
      List<Sources> sabqList =
          sources.where((source) => source.id == 'sabq').toList();
      emit(GetExploreSuccess(sabqList));
    });
  }

  Future<void> fetchABC() async {
    emit(GetExploreLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetExploreFailure(failure.errMessage));
    }, (sources) {
      List<Sources> abcList =
          sources.where((source) => source.id == 'abc-news').toList();
      emit(GetExploreSuccess(abcList));
    });
  }

  Future<void> fetchArgaam() async {
    emit(GetExploreLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetExploreFailure(failure.errMessage));
    }, (sources) {
      List<Sources> argaamList =
          sources.where((source) => source.id == 'argaam').toList();
      emit(GetExploreSuccess(argaamList));
    });
  }

  Future<void> fetchBloomberg() async {
    emit(GetExploreLoading());
    var result = await homeRepo.fetchSources();
    result.fold((failure) {
      emit(GetExploreFailure(failure.errMessage));
    }, (sources) {
      List<Sources> bloombergList =
          sources.where((source) => source.id == 'bloomberg').toList();
      emit(GetExploreSuccess(bloombergList));
    });
  }
}

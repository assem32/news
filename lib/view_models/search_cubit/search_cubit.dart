import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/article_model.dart';

import '../../repos/home_repo.dart';
import 'search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearch({required String searchKey}) async {
    emit(SearchLoading());
    var result = await homeRepo.fetchArticles();
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (articles) {
      List<Articles> searchList=articles.where((article) => article.title!.toLowerCase().startsWith(searchKey)).toList();
      emit(SearchSuccess(searchList));
    });
  }
}

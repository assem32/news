
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/home_repo.dart';
import 'get_articles_state.dart';

class GetArticlesCubit extends Cubit<GetArticlesState> {
  GetArticlesCubit(this.homeRepo) : super(GetArticlesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchGetArticles() async {
    emit(GetArticlesLoading());
    var result = await homeRepo.fetchArticles();
    result.fold((failure) {
      emit(GetArticlesFailure(failure.errMessage));
    }, (articles) {
      emit(GetArticlesSuccess(articles));
    });
  }
}

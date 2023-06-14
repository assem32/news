import '../../models/article_model.dart';

abstract class GetArticlesState{}

class GetArticlesInitial extends GetArticlesState{}

class GetArticlesLoading extends GetArticlesState{}
class GetArticlesSuccess extends GetArticlesState{
  final List<Articles> articles;
  GetArticlesSuccess(this.articles);
}
class GetArticlesFailure extends GetArticlesState{
  final String errMessage;
  GetArticlesFailure(this.errMessage);
}
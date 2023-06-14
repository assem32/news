
import 'package:news/models/article_model.dart';


abstract class SearchState{}

class SearchInitial extends SearchState{}

class SearchLoading extends SearchState{}
class SearchSuccess extends SearchState{
  final List<Articles> articles;
  SearchSuccess(this.articles);
}
class SearchFailure extends SearchState{
  final String errMessage;
  SearchFailure(this.errMessage);
}
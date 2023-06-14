import '../../models/article_model.dart';

abstract class GetTechnologyState{}

class GetTechnologyInitial extends GetTechnologyState{}

class GetTechnologyLoading extends GetTechnologyState{}
class GetTechnologySuccess extends GetTechnologyState{
  final List<Articles> articles;
  GetTechnologySuccess(this.articles);
}
class GetTechnologyFailure extends GetTechnologyState{
  final String errMessage;
  GetTechnologyFailure(this.errMessage);
}
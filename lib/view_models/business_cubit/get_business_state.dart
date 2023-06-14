import '../../models/article_model.dart';

abstract class GetBusinessState{}

class GetBusinessInitial extends GetBusinessState{}

class GetBusinessLoading extends GetBusinessState{}
class GetBusinessSuccess extends GetBusinessState{
  final List<Articles> articles;
  GetBusinessSuccess(this.articles);
}
class GetBusinessFailure extends GetBusinessState{
  final String errMessage;
  GetBusinessFailure(this.errMessage);
}

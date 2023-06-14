import '../../models/article_model.dart';

abstract class GetHeadLinesCategoryState{}

class GetHeadLinesCategoryInitial extends GetHeadLinesCategoryState{}

class GetHeadLinesBusinessLoading extends GetHeadLinesCategoryState{}
class GetHeadLinesBusinessSuccess extends GetHeadLinesCategoryState{
  final List<Articles> articles;
  GetHeadLinesBusinessSuccess(this.articles);
}
class GetHeadLinesBusinessFailure extends GetHeadLinesCategoryState{
  final String errMessage;
  GetHeadLinesBusinessFailure(this.errMessage);
}

class GetHeadLinesTechnologyLoading extends GetHeadLinesCategoryState{}
class GetHeadLinesTechnologySuccess extends GetHeadLinesCategoryState{
  final List<Articles> articles;
  GetHeadLinesTechnologySuccess(this.articles);
}
class GetHeadLinesTechnologyFailure extends GetHeadLinesCategoryState{
  final String errMessage;
  GetHeadLinesTechnologyFailure(this.errMessage);
}
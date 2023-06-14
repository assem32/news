import '../../models/article_model.dart';

abstract class GetHeadLinesCategoryState{}

class GetHeadLinesCategoryInitial extends GetHeadLinesCategoryState{}

class GetHeadLinesCategoryLoading extends GetHeadLinesCategoryState{}
class GetHeadLinesCategorySuccess extends GetHeadLinesCategoryState{
  final List<Articles> articles;
  GetHeadLinesCategorySuccess(this.articles);
}
class GetHeadLinesCategoryFailure extends GetHeadLinesCategoryState{
  final String errMessage;
  GetHeadLinesCategoryFailure(this.errMessage);
}
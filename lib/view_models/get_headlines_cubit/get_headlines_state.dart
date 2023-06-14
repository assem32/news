
import '../../models/article_model.dart';

abstract class GetHeadLinesState{}

class GetHeadLinesInitial extends GetHeadLinesState{}

class GetHeadLinesLoading extends GetHeadLinesState{}
class GetHeadLinesSuccess extends GetHeadLinesState{
  final List<Articles> headlines;
  GetHeadLinesSuccess(this.headlines);
}
class GetHeadLinesFailure extends GetHeadLinesState{
  final String errMessage;
  GetHeadLinesFailure(this.errMessage);
}
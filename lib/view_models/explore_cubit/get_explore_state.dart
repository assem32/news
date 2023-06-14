
import '../../models/sources_model.dart';

abstract class GetExploreState{}

class GetExploreInitial extends GetExploreState{}

class GetExploreLoading extends GetExploreState{}
class GetExploreSuccess extends GetExploreState{
  final List<Sources> sources;
  GetExploreSuccess(this.sources);
}
class GetExploreFailure extends GetExploreState{
  final String errMessage;
  GetExploreFailure(this.errMessage);
}
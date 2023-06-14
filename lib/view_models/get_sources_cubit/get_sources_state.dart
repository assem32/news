
import '../../models/sources_model.dart';

abstract class GetSourcesState{}

class GetSourcesInitial extends GetSourcesState{}

class GetSourcesLoading extends GetSourcesState{}
class GetSourcesSuccess extends GetSourcesState{
  final List<Sources> sources;
  GetSourcesSuccess(this.sources);
}
class GetSourcesFailure extends GetSourcesState{
  final String errMessage;
  GetSourcesFailure(this.errMessage);
}
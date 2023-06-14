
import '../../models/sources_model.dart';

abstract class GetExploreState{}

class GetExploreInitial extends GetExploreState{}

class GetExploreBBCLoading extends GetExploreState{}
class GetExploreBBCSuccess extends GetExploreState{
  final List<Sources> sources;
  GetExploreBBCSuccess(this.sources);
}
class GetExploreBBCFailure extends GetExploreState{
  final String errMessage;
  GetExploreBBCFailure(this.errMessage);
}

class GetExploreABCLoading extends GetExploreState{}
class GetExploreABCSuccess extends GetExploreState{
  final List<Sources> sources;
  GetExploreABCSuccess(this.sources);
}
class GetExploreABCFailure extends GetExploreState{
  final String errMessage;
  GetExploreABCFailure(this.errMessage);
}

class GetExploreBloombergLoading extends GetExploreState{}
class GetExploreBloombergSuccess extends GetExploreState{
  final List<Sources> sources;
  GetExploreBloombergSuccess(this.sources);
}
class GetExploreBloombergFailure extends GetExploreState{
  final String errMessage;
  GetExploreBloombergFailure(this.errMessage);
}

class GetExploreArgaamLoading extends GetExploreState{}
class GetExploreArgaamSuccess extends GetExploreState{
  final List<Sources> sources;
  GetExploreArgaamSuccess(this.sources);
}
class GetExploreArgaamFailure extends GetExploreState{
  final String errMessage;
  GetExploreArgaamFailure(this.errMessage);
}

class GetExploreSabqLoading extends GetExploreState{}
class GetExploreSabqSuccess extends GetExploreState{
  final List<Sources> sources;
  GetExploreSabqSuccess(this.sources);
}
class GetExploreSabqFailure extends GetExploreState{
  final String errMessage;
  GetExploreSabqFailure(this.errMessage);
}

class GetExploreAlJazzeraLoading extends GetExploreState{}
class GetExploreAlJazzeraSuccess extends GetExploreState{
  final List<Sources> sources;
  GetExploreAlJazzeraSuccess(this.sources);
}
class GetExploreAlJazzeraFailure extends GetExploreState{
  final String errMessage;
  GetExploreAlJazzeraFailure(this.errMessage);
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../api_service/api_services.dart';
import '../api_service/end_point.dart';
import '../errors/failures.dart';
import '../models/article_model.dart';
import '../models/sources_model.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo{
  final ApiService _apiService;
  HomeRepoImp(this._apiService);
  @override
  Future<Either<Failure, List<Articles>>> fetchArticles() async{
    try{
      var data = await _apiService.get(endPoint: everything,query: {
        'q':'bitcoin',
        'apiKey': apiKey,
      });
      ArticleModel articleModel=ArticleModel.fromJson(data);
      return right(articleModel.articles!);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Articles>>> fetchHeadLines() async{
    try{
      var data = await _apiService.get(endPoint: headlines,query: {
        'country':'sa',
        'apiKey': apiKey,
      });
      ArticleModel headLines=ArticleModel.fromJson(data);
      return right(headLines.articles!);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Sources>>> fetchSources() async {
    try{
      var data = await _apiService.get(endPoint: sources,query: {
        'apiKey': apiKey,
      });
      SourcesModel sourcesModel=SourcesModel.fromJson(data);
      return right(sourcesModel.sources!);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
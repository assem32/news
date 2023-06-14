import 'package:dartz/dartz.dart';
import '../errors/failures.dart';
import '../models/article_model.dart';
import '../models/sources_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<Articles>>>fetchArticles();
  Future<Either<Failure,List<Articles>>>fetchHeadLines();
  Future<Either<Failure,List<Sources>>>fetchSources();
}
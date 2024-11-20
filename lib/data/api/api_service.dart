import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prj_reqres/data/api/dio_config.dart';
import 'package:prj_reqres/data/model/detail_response.dart';
import 'package:prj_reqres/data/model/users_response.dart';
import 'package:prj_reqres/service_locator/locator.dart';

import '../../common/constants.dart';

class ApiService {
  final DioConfig dioConfig = locator<DioConfig>();

  /// [GET] Get All Users
  Future<Either<String, UsersResponse>> getAllUser() async {
    try {
      final response = await dioConfig.request('users', DioMethod.get);
      return Right(UsersResponse.fromJson(response.data));
    } on DioException catch (e) {
      return _handleException(e);
    } catch (e) {
      return const Left(Constants.defaultError);
    }
  }

  /// [GET] Get Detail User by Id
  Future<Either<String, DetailUserResponse>> getDetailUser(int userId) async {
    try {
      final response = await dioConfig.request('users/$userId', DioMethod.get);
      return Right(DetailUserResponse.fromJson(response.data));
    } on DioException catch (e) {
      return _handleException(e);
    } catch (e) {
      return const Left(Constants.defaultError);
    }
  }

  Left<String, T> _handleException<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        return const Left(Constants.connectionError);
      case DioExceptionType.sendTimeout:
        return const Left(Constants.timeoutError);
      case DioExceptionType.receiveTimeout:
        return const Left(Constants.timeoutError);
      case DioExceptionType.badResponse:
        return const Left(Constants.badResponse);
      case DioExceptionType.cancel:
        return const Left(Constants.defaultError);
      case DioExceptionType.connectionTimeout:
        return const Left(Constants.connectionError);
      default:
        return const Left(Constants.defaultError);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:alaa_taher/features/search_meals/data/models/details_model.dart';
import 'package:alaa_taher/features/search_meals/data/models/search_result_model.dart';

class MealService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1";
  final Dio dio;

  MealService(this.dio);

  Future<List<SearchResultModel>> getSearchedMeals(
      {required String searchWord}) async {
    try {
      Response response = await dio.get("$baseUrl/search.php?s=$searchWord");
      print(response.data);

      if (response.data['meals'] == null) {
        return [];
      }

      List<SearchResultModel> searchResultList =
          (response.data['meals'] as List)
              .map((meal) => SearchResultModel.fromJson(meal))
              .toList();

      return searchResultList;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? "There is an error";
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SearchResultModel>> filterMeals(
      {required String mealType}) async {
    try {
      Response response = await dio.get("$baseUrl/filter.php?c=$mealType");
      print(response.data);

      if (response.data['meals'] == null) {
        return [];
      }

      List<SearchResultModel> searchResultList =
          (response.data['meals'] as List)
              .map((meal) => SearchResultModel.fromJson(meal))
              .toList();

      return searchResultList;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? "There is an error";
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailsModel?> getDetails({required String mealName}) async {
    try {
      Response response = await dio.get("$baseUrl/search.php?s=$mealName");
      print("details: ${response.data}");

      if (response.data['meals'] == null) {
        return null;
      }

      return DetailsModel.fromJson(response.data['meals'][0]);
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? "There is an error";
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:meal_tracking_app/features/search_meals/data/models/search_result_model.dart';

class SearchService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1";
  final Dio dio;

  SearchService(this.dio);

  Future<List<SearchResultModel>> getSearchedMeals({required String searchWord}) async {
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
}
